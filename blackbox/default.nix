{ stdenv
, fetchFromGitHub
, gnupg ? pkgs.gnupg
, pkgs ? import <nixpkgs> {}
}:

stdenv.mkDerivation rec {
  name = "blackbox-1b443ff682";
  gitdir = fetchFromGitHub {
    owner = "StackExchange";
    repo = "blackbox";
    rev = "1b443ff682e0bda75267e625ccbca0b8bf8d1e79";
    sha256 = "18jd9dfcjw836g38rj9bb1pcn738ar27j1k7ywgvakxi7d8na3zz";
  };
  src = [ gitdir ];
  buildInputs = [ gnupg ];
  patchPhase = ''
    sed -i 's@GPG:=gpg@GPG:=${gnupg}/bin/gpg2@' bin/_blackbox_common.sh
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp bin/* $out/bin
  '';
}
