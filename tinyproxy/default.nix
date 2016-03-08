{stdenv, fetchgit, fetchurl, openssl, libev, asciidoc
, docbook_xml_dtd_44
, libxml2}:

stdenv.mkDerivation {
  name = "tinyproxy-1.8.4";

  src = fetchurl {
    url = "https://github.com/tinyproxy/tinyproxy/releases/download/1.8.4/tinyproxy-1.8.4.tar.xz";
    sha256 = "002hi97687czhfkwsjkr174yvlp10224qi6gd5s53z230bgls7x4";
  };
  buildInputs = [ openssl asciidoc libxml2 ];

  A2X_ARGS = "-d manpage -f manpage -L";
  
  postPatch = ''
    substituteInPlace Makefile.in \
      --replace @A2X@ "@A2X@ -L"
  '';
}

