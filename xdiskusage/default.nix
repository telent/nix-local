{stdenv, fetchgit, fltk13, autoconf}:

stdenv.mkDerivation {
  name = "xdiskusage-1.51";

  src = fetchgit {
    url = "git://git.code.sf.net/p/xdiskusage/git";
    rev = "2fa92f0544169fbf0173dfbfd519488a16b641af";
    sha256 = "1rir6qs6qd79pvmjnwppspxa8mr78rpvv8l0qawxdkr8jaxl5mv2";
  };
  preConfigure = ''
    autoconf
  '';
  buildInputs = [ fltk13 autoconf  ];

}

