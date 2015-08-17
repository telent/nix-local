{
  git = {
    svnSupport = true;
  };
  packageOverrides = pkgs: rec {
    vault = pkgs.callPackage ./vault {};
    blackbox = pkgs.callPackage ./blackbox {};
    xdiskusage = pkgs.callPackage ./xdiskusage {};

    # these are for hacking on unpackaged ruby projects, not for use
    # in package building.  e.g.
    # 
    #   nix-shell '<nixpkgs>' -A ruby22env

    rubyenv = attrs: let
      git = (if (builtins.hasAttr "git" attrs) then attrs.git else pkgs.gitMinimal);
      defaults = rec {
        # We set BUNDLE_PATH for the benefit of interactive ruby
        # sessions started by nix-shell.  If we were building actual
        # packages using this derivation, $HOME would not exist and
        # thus "bundle install" would fail.  Then again, calling
        # "bundle install" directly would be contraindicated anyway as
        # nix should be doing dep management for nix packages, not
        # Ruby
	rel = attrs.rel;
        name = "rubyenv-${rel}";
        version = rel;
	CFLAGS = "-std=c99";
        BUNDLE_PATH = "${(builtins.getEnv ''HOME'')}/.bundle/${version}/";
        BUNDLE_BUILD__NOKOGIRI = with pkgs; "--use-system-libraries --with-libxml-2.0-config=${libxml2}/bin/xml2-config --with-libxslt-config=${libxslt}/bin/xslt-config --with-xslt-dir=${libxslt} --with-xml2-dir=${libxml2} --with-xml2-include=${libxml2}/include/libxml2 ";
	src = ./.;
      };
      overrides = {
        buildInputs = attrs.buildInputs ++ [ 
          git pkgs."ruby_${attrs.rel}" bundler_1_10 
          pkgs.libxml2 pkgs.libxslt pkgs.libiconv  ];
      }; in (defaults // attrs // overrides);      

    ruby22env = pkgs.stdenv.mkDerivation (rubyenv { rel = "2_2";});
    ruby20env = pkgs.stdenv.mkDerivation (rubyenv { rel = "2_0";});

    # libusb depends on a horrible set of linux-only crap that ends up
    # with systemd
    gnupg_nousb = (pkgs.gnupg.override { libusb = null; x11Support = false; });

    # this likewise is only for nix-shell
    iodide = pkgs.stdenv.mkDerivation 
      (let r = (rubyenv { rel = "2_2"; }) ; in r // rec {
        name = "iodide" ;
        version = "0.0.1";
        src = "./.";
        buildInputs = [ pkgs.curl blackbox hiera ] ++ [ r.buildInputs ];
      });
    
    cmm = pkgs.stdenv.mkDerivation 
      (let r = (rubyenv { rel = "2_0";}) ; in r // rec {
        name = "cmm" ;
        version = "0.0.1";
        src = "./.";
        buildInputs = [ pkgs.mongodb pkgs.postgresql94 pkgs.libiconv 
	                pkgs.libxslt pkgs.freetds ] ++
		      [ r.buildInputs ];
  	preBuild = with pkgs; ''
	  bundle config --local build.nokogiri  --with-xml2-include=${libxml2}/include/libxml2 --use-system-libraries --with-xml2-config=${libxml2}/bin/xml2-config --with-xslt-config=${libxslt}/bin/xslt-config	  
	'';
	PGPORT = 5440;
	shellHook = ''
	  export CALL_ME_MAYBE_POSTGRES_PORT=$PGPORT
	  startServers() {
    	    echo starting postgres and mongo
	    test -d $HOME/var/pgsql || initdb -A trust -D $HOME/var/pgsql
	    pg_ctl  -o "-F -p $PGPORT"  -D $HOME/var/pgsql -l postgres.log start
	    while ! pg_ctl -o "-F -p $PGPORT"  -D $HOME/var/pgsql  status ;do
	      echo -n "waiting for pgsql to start: "
	      sleep 1
	    done
	    createuser -s $USER -p $PGPORT
	    mkdir -p $HOME/var/mongodb
	    mongod --noauth --dbpath $HOME/var/mongodb --logpath mongo.log --fork --pidfilepath $HOME/var/mongodb/mongod.pid
	  }
	  stopServers() {
	    kill `cat $HOME/var/mongodb/mongod.pid`
 	    pg_ctl -D $HOME/var/pgsql -l postgres.log stop
	  }

	'';
      });
      
    # $JOB uses bundler 1.10 which is not yet in nixpkgs
    bundler_1_10 = pkgs.buildRubyGem {
      name = "bundler-1-10";
      src = pkgs.fetchgit {
	url = "https://github.com/bundler/bundler.git";
	rev = "b5db5535355e37a9bc23b87acc602e0398b3ec3c";
	sha256 = "09x1rdxqhv5z0da3cwyn3cnzadi0y7d6708bylplvip22gd75g0c";
	leaveDotGit = true;
      };
      dontPatchShebangs = true;
      postInstall = ''
	find $out -type f -perm +0100 | while read f; do
	  substituteInPlace $f \
	     --replace "/usr/bin/env" "${pkgs.coreutils}/bin/env"
	done
      '';
    };

    json_gem = pkgs.buildRubyGem {
      name = "json_pure-1.8.2";
      version = "1.8.2";
      sha256 = "1vjm8fqbs06i3klsqdim9jp52mmwc4dm33dc8ajdci9hp2dngl4a";
    };
    hiera = pkgs.buildRubyGem {
      name = "hiera-3.0.1";
      sha256 = "1k2ajl0hd2iryikhc6yb84fhfksjn73p0paabmx0q862kwgqy34f";
      buildInputs = [ json_gem ];
    };
  };
}
