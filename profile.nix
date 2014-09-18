let
     pkgs = import <nixpkgs> {};
     stdenv = pkgs.stdenv;
in rec {
  # TODO: macvim currently won't build for me
  # macvim = pkgs.macvim;

  go = pkgs.go;
  fish = pkgs.fish;

  # TODO: git setup breaks on https
  # git = pkgs.git
  # hub = pkgs.gitAndTools.hub

  mercurial = pkgs.mercurial;
  sloccount = pkgs.sloccount;

  silversearcher = stdenv.mkDerivation rec {
    name = "silversearcher-${version}";
    version = "0.24.1";

    src = fetchurl {
      url = "https://github.com/ggreer/the_silver_searcher/archive/0.24.1.tar.gz";
      sha256 = "84e6613d2b774926c5ecce996b9809bfb1c16e4294cbfc0a3dc97a1006cfa2a4";
    };

    buildInputs = [ automake lzma ];

    buildPhase = "./build.sh";

    meta = with stdenv.lib; {
      description = "The Silver Searcher is a tool for searching code";
      homepage = "http://geoff.greer.fm/ag/";
      license = licenses.apache2;
      platforms = platforms.unix;
    };
  };
}
