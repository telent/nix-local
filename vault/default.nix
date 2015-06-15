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
     rev = "02ae901a504c5a692283d185504dae094e7cd6d9";
     sha256 = "1dvmlaiynmhwy1a43lr6hrf8i1hc0zhdcivn7qghz987f9ggw1hm";
   };

   name = "vault-0.3.0";
   bin = true;
   src = [ gitdir ];
   buildInputs = [] ;
   deps = (filter (v: nixType v == "derivation") (attrValues nodePackages));
   peerDependencies = [];
}
