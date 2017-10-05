{stdenv, fetchgit, fltk13, autoconf}:

stdenv.mkDerivation {
  name = "xdiskusage-1.51";

  src = fetchgit {
    url = "git://git.code.sf.net/p/xdiskusage/git";
    rev = "2fa92f0544169fbf0173dfbfd519488a16b641af";
    sha256 = "0ldqrcf250sncm6arilqf6170bqykqa1kqfd8f1wd4vxnnp29kxl";
  };
  preConfigure = ''
    autoconf
  '';
  buildInputs = [ fltk13 autoconf  ];

}

