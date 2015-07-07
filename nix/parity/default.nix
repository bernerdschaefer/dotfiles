{ stdenv, fetchurl, postgresql, git, heroku }:

with stdenv.lib;
stdenv.mkDerivation rec {
  version = "0.7.0";
  name = "parity-${version}";

  meta = {
    homepage = "https://github.com/thoughtbot/parity";
    description = "Shell commands for development, staging, and production parity for Heroku apps";
    license = licenses.mit;
  };

  src = fetchurl {
    url = "https://github.com/thoughtbot/parity/archive/v${version}.tar.gz";
    sha256 = "0z8qhvsb4qbci7nzp5s1db97liswjcwbhmbg7bwrq2m5y5s9jvn6";
  };

  installPhase = ''
    mkdir -p $out $out/bin
    cp bin/{development,staging,production} $out/bin/
    cp -R lib/ $out/lib/
    cp README.md $out/
  '';

  buildInputs = [ postgresql git heroku ];
}
