{stdenv
, fetchgit
, autoconf
, automake
, git
, libtool
, ortp
, popt
, openssl
, pkgs
, mediastreamer
, net_snmp
, coreutils
, pkgconfig }:

let sofia_sip_bc = pkgs.stdenv.lib.overrideDerivation pkgs.sofia_sip (o : {
  name = "sofia-sip-bc-ec5145d";
  src = fetchgit {
    sha256 = "1il4w81mnkwy4ivyf5zwicli2337zmyrq5b0nk234rlqzrz954hh";
    url = "git://git.linphone.org/sofia-sip.git";
    rev = "ec5145ddde0a0452999b08df4e3c61f3ff5f6730";
  };
  nativeBuildInputs = o.nativeBuildInputs ++ [ autoconf automake libtool pkgconfig ];
  preConfigure = ''
    cp ${automake}/share/automake-1.15/{missing,install-sh} ./
    ./autogen.sh
  '';
}); in stdenv.mkDerivation {
    name = "flexisip-6fe9a1";
    src = fetchgit {
      url = "git://git.linphone.org/flexisip.git";
      rev = "6fe9a12d26599fdcba09a96a1bf74c903ccf0d9c";
      sha256 = "08q8j1khn0a2a7n3m3gzkcsfs7gv5zfq2si2yjsbgcsb7sh2k0l8";
    };
    preConfigure = ''
      ./autogen.sh
    '';
    configureFlags = "--enable-odbc=no";
    makeFlags = "ECHO=${coreutils}/bin/echo";
    buildInputs = [net_snmp ortp sofia_sip_bc autoconf automake libtool pkgconfig openssl mediastreamer git ];

}
