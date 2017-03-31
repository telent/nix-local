with import <nixpkgs> {};
let linuxPaths = [
  acpi
  cdrkit
  firefox
  gimp
  jwhois
  mupdf
  tcpdump
  usbutils
  wayland
  weston
  wireshark
  xterm
];
darwinPaths = [];
commonPaths = [
  binutils
  emacs
  file
  git
  gnumake
  iftop
  manpages
  nmap
  nodejs_vault
  python
  python27Packages.pip
  tmux
  unzip
];
  in
{
  git = {
    svnSupport = true;
  };
  packageOverrides = pkgs: rec {
    desktop = buildEnv {
      name = "desktop";
      paths = with pkgs; [ nix cacert ] ++
      commonPaths ++
      (stdenv.lib.optionals stdenv.isDarwin darwinPaths) ++
      (stdenv.lib.optionals stdenv.isLinux linuxPaths) ;
    };
    nodejs_vault = pkgs.callPackage ./vault {};
    blackbox = pkgs.callPackage ./blackbox {};
    xdiskusage = pkgs.callPackage ./xdiskusage {};
    flexisip = pkgs.callPackage ./flexisip {};
    hitch = pkgs.callPackage ./hitch {};
    tinyproxy = pkgs.callPackage ./tinyproxy {};
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
