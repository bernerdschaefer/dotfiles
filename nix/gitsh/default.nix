{ stdenv, fetchurl, ruby }:

with stdenv.lib;

stdenv.mkDerivation rec {
  name = "gitsh-${version}";
  version = "0.9.0";

  src = fetchurl {
    url = "https://github.com/thoughtbot/gitsh/releases/download/v0.9/gitsh-0.9.tar.gz";
    sha256 = "bd6e278e60b71cc30734ae199154c797554b278bd7f813d1d5783a80c5bd1891";
  };

  buildInputs = [
    (ruby.override { cursesSupport = true; })
  ];

  meta = with stdenv.lib; {
    description = "";
    homepage = "";
    license = "";
    platforms = platforms.unix;
  };
}
