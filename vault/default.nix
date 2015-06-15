{ vault ? { outPath = ./.; name = "vault"; }
, stdenv
, callPackage
, pkgs ? import <nixpkgs> {}
}:

with stdenv.lib;

let
  nodePackages = callPackage (import "${pkgs.path}/pkgs/top-level/node-packages.nix") {
    self = nodePackages;
    generated = ./node-packages.generated.nix;
  };
in nodePackages.buildNodePackage rec {
   # I can't make the version of vault in npm work even without 
   # Nix, I don't know why.  So this package is based on an earlier
   # version which we get straight from Git
   gitdir = pkgs.fetchgit {
     url = "https://github.com/jcoglan/vault.git";
     rev = "02ae901a504c5a692283d185504dae094e7cd6d9";
     sha256 = "0znng8812dlw796rgw11hj3gg7xgp09m3047kwkzvmigapsdq38q";
   };

   name = "vault-0.3.0";
   src = [ gitdir ];
   buildInputs = [] ;
   deps = (filter (v: nixType v == "derivation") (attrValues nodePackages));
   peerDependencies = [];
}
