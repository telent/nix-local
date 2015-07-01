{
  packageOverrides = pkgs: rec {
    vault = pkgs.callPackage ./vault {};
    blackbox = pkgs.callPackage ./blackbox {};
  };
}
