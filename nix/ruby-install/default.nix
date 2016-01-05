{ stdenv
, fetchurl
, bash
, binutils
, gcc
, gnumake
, libyaml
, makeWrapper
, ncurses
, openssl
, readline
, zlib
}:

with stdenv.lib;

stdenv.mkDerivation rec {
  name = "ruby-install-${version}";
  version = "0.6.0";

  src = fetchurl {
    url = "https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz";
    sha256 = "0zgk583dx93l7mm9ijqkg929d96hksnz56kq06v8hbcpr930ij9w";
  };

  buildInputs = [
    bash
    binutils
    gcc
    gnumake
    libyaml
    makeWrapper
    ncurses
    openssl
    zlib
  ];

  buildPhase = ''
    true
  '';

  installPhase = ''
    make install PREFIX=$out/
    wrapProgram $out/bin/ruby-install \
      --set CFLAGS "\" -I${libyaml}/include -I${ncurses}/include -I${openssl}/include -I${readline}/include -I${zlib}/include \"" \
      --set LDFLAGS "\" -L${libyaml}/lib -L${ncurses}/lib -L${openssl}/lib -L${readline}/lib -L${zlib}/lib \"" \
      --prefix PATH : ${binutils}/bin \
      --prefix PATH : ${gnumake}/bin \
      --prefix PATH : ${gcc}/bin
  '';

  meta = with stdenv.lib; {
    description = "";
    homepage = "";
    license = "";
    platforms = platforms.unix;
  };
}
