{ stdenv
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
   gitdir = pkgs.fetchFromGitHub {
     owner = "jcoglan";
     repo = "vault";
     rev = "0.3.0";
     sha256 = "1ffm90ygfqqxh4d5xcbwqvn7ycs5dbn9f3211if3rwd92jm0z99x";
   };

   version = "0.3.0";
   name = "vault-${version}";
   bin = true;
   src = [ gitdir ];
   buildInputs = [] ;
   deps = (filter (v: nixType v == "derivation") (attrValues nodePackages));
   peerDependencies = [];
}
