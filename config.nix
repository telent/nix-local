{
  packageOverrides = pkgs: {
    vault = pkgs.callPackage ./vault {};
    # repeat for each package herein
  };
}
