{ vault ? { outPath = ./.; name = "vault"; }
, stdenv
, fetchFromGitHub
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
   gitdir = pkgs.fetchFromGitHub {
     owner = "jcoglan";
     repo = "vault";
     rev = "f6913eb5a79b44343e8a1c364f10c140bcd7e1bd";
     sha256 = "1z3mxbbn6grr4qpmpzzmwbqwx9p3a7g857v2mi8j767d1p27678r";
   };

   name = "vault-0.3.0";
   bin = true;
   src = [ gitdir ];
   buildInputs = [] ;
   deps = (filter (v: nixType v == "derivation") (attrValues nodePackages));
   peerDependencies = [];
}
