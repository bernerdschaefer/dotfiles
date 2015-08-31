{ stdenv, fetchurl
, autoconf, automake, cmake, libevent, libtool, ncurses
, openssl, pkgconfig, ruby, zlib
}:

with stdenv.lib;
stdenv.mkDerivation rec {
  name = "tmate-${version}";
  version = "1.8.10";

  src = fetchurl {
    url = "https://github.com/nviennot/tmate/archive/1.8.10.tar.gz";
    sha256 = "0sbxbsarr7g8kdkr6fwpgx4pxidw959rywbhynbqmmrygsq7pynb";
  };

  dontUseCmakeConfigure = true;

  buildInputs = [
    autoconf
    automake
    cmake
    libevent
    libtool
    ncurses
    openssl
    pkgconfig
    ruby
    zlib
  ];

  preConfigure = "./autogen.sh";

  meta = {
    description = "Instant Terminal Sharing";
    homepage = "http://tmate.io/";
    license = licenses.bsd3;
    platforms = platforms.unix;
  };
}
