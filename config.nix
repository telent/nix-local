{
  git = {
    svnSupport = true;
  };
  packageOverrides = pkgs: rec {
    nodejs_vault = pkgs.callPackage ./vault {};
    blackbox = pkgs.callPackage ./blackbox {};
    xdiskusage = pkgs.callPackage ./xdiskusage {};
    flexisip = pkgs.callPackage ./flexisip {};
    hitch = pkgs.callPackage ./hitch {};
    tinyproxy = pkgs.callPackage ./tinyproxy {};	
  };
}
