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
     rev = "0.3.0";
     sha256 = "1ffm90ygfqqxh4d5xcbwqvn7ycs5dbn9f3211if3rwd92jm0z99x";
   };

   name = "vault-0.3.0";
   bin = true;
   src = [ gitdir ];
   buildInputs = [] ;
   deps = (filter (v: nixType v == "derivation") (attrValues nodePackages));
   peerDependencies = [];
}
