{
  packageOverrides = pkgs: rec {
    vault = pkgs.callPackage ./vault {};
    blackbox = pkgs.callPackage ./blackbox {};
    
    # these are for hacking on unpackaged ruby projects, not for use
    # in package building.  e.g.
    # 
    #   nix-shell '<nixpkgs>' -A ruby22env

    rubyenv = rel: 
      pkgs.stdenv.mkDerivation rec {
        # We set BUNDLE_PATH for the benefit of interactive ruby
        # sessions started by nix-shell.  If we were building actual
        # packages using this derivation, $HOME would not exist and
        # thus "bundle install" would fail.  Then again, calling
        # "bundle install" directly would be contraindicated anyway as
        # nix should be doing dep management for nix packages, not
        # Ruby
        name = "rubyenv-${rel}";
        version = rel;
	CFLAGS = "-std=c99";
        BUNDLE_PATH = "${(builtins.getEnv ''HOME'')}/.bundle/${version}/";
        src = ./.;
        buildInputs = [ 
          pkgs.git pkgs."ruby_${rel}" bundler_1_10 
          pkgs.libxml2 pkgs.libiconv ];
      };

    ruby22env = rubyenv "2_2";
    ruby20env = rubyenv "2_0";

    # libusb depends on a horrible set of linux-only crap that ends up
    # with systemd
    gnupg = (pkgs.gnupg.override { libusb = null; });

    bundler_1_10 = pkgs.buildRubyGem {
      name = "bundler-1-10";
      src = pkgs.fetchgit {
	url = "https://github.com/bundler/bundler.git";
	rev = "b5db5535355e37a9bc23b87acc602e0398b3ec3c";
	sha256 = "0s4pvchx5sq6jzsfwdw9pl7vciy9lz5kfx5n9wdy0jq0rrwby4y0";
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
  };
}
