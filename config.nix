with import <nixpkgs> {};
let linuxPaths = [
#  xfce4_powerman
  acpi
  cdrkit
  firefox
  gimp
  mplayer
  mupdf
  tcpdump
  usbutils
  vimNox
  xorg.xcursorthemes
  wireshark
  xterm
  xorg.xwd
  imagemagick
  python27Packages.docker_compose
  powertop
  inkscape
  xdiskusage
  inetutils
];
darwinPaths = [];
commonPaths = [
  nix-repl
  git
  bind
  binutils
  emacs
  file
  gnumake
  gnupg
  iftop
  jq
  manpages
  mosh
  nmap
  pass
  python
  python27Packages.pip
  tmux
  units
  unzip
  vlc
];
  in
{
  # git = {
  #   svnSupport = true;
  # };

  packageOverrides = pkgs: rec {
    desktop = buildEnv {
      name = "desktop";
      paths = with pkgs; [ nix cacert  ] ++
      commonPaths ++
      (stdenv.lib.optionals stdenv.isDarwin darwinPaths) ++
      (stdenv.lib.optionals stdenv.isLinux linuxPaths) ;
    };
    blackbox = pkgs.callPackage ./blackbox {};
    xdiskusage = pkgs.callPackage ./xdiskusage {};
    tinyproxy = pkgs.callPackage ./tinyproxy {};

    get_iplayer = lib.overrideDerivation pkgs.get_iplayer (a: rec {
       version = "3.01";
       src = fetchFromGitHub {
         owner = "get-iplayer";
         repo = "get_iplayer";
         rev = "v${version}";
         sha256 = "1g08amb08n5nn0v69dgz9g5rpy4yd0aw9iww1ms98rrmqnv6l46y";
       };
    });

    jruby = lib.overrideDerivation pkgs.jruby (a: rec {
       version = "1.7.23";
       name = "jruby-${version}";
       dontStrip = true;
       src = pkgs.fetchurl {
         url = "http://jruby.org.s3.amazonaws.com/downloads/${version}/jruby-bin-${version}.tar.gz";
         sha1 = "23iii8vwszrjzgzq0amwyazdxrppjpib";
       };
       # make "ruby" run jruby
       installPhase = ''
         ${a.installPhase}
         (cd $out/bin && ln -s jruby ruby)
       '';
    });
  };
}
