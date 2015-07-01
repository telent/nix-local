{ stdenv
, fetchFromGitHub
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
  buildInputs = [ pkgs.gnupg_nousb ];
  patchPhase = ''
    sed -i 's@GPG:=gpg@GPG:=${pkgs.gnupg_nousb}/bin/gpg2@' bin/_blackbox_common.sh
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp bin/* $out/bin
  '';
}
