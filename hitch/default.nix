{stdenv, fetchgit, fetchurl, openssl, libev}:

stdenv.mkDerivation {
  name = "hitch-1.1.0";

  src = fetchurl {
    url = "https://hitch-tls.org/source/hitch-1.1.0.tar.gz";
    sha256 = "036pjlx7cxdlz14lscdcgcrxidkg9lgzvkkpcjsvivrjlln36x4s";
  };
  buildInputs = [ libev openssl  ];

}

