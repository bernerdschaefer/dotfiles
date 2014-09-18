let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;
in rec {
  # TODO: macvim currently won't build for me
  # macvim = pkgs.macvim;

  # TODO: git setup breaks on https
  # git = pkgs.git
  # hub = pkgs.gitAndTools.hub

  go = pkgs.go;
  fish = pkgs.fish;

  mercurial = pkgs.mercurial;
  sloccount = pkgs.sloccount;
  ctags = pkgs.ctags;

  silversearcher = stdenv.mkDerivation rec {
    name = "silversearcher-${version}";
    version = "0.24.1";

    src = pkgs.fetchurl {
      url = "https://github.com/ggreer/the_silver_searcher/archive/0.24.1.tar.gz";
      sha256 = "84e6613d2b774926c5ecce996b9809bfb1c16e4294cbfc0a3dc97a1006cfa2a4";
    };

    nativeBuildInputs = [ pkgs.pkgconfig pkgs.autoconf pkgs.automake ];
    buildInputs = [ pkgs.lzma pkgs.pcre ];

    preConfigure = ''
      ${pkgs.automake}/bin/aclocal
      ${pkgs.autoconf}/bin/autoconf
      ${pkgs.autoconf}/bin/autoheader
      ${pkgs.automake}/bin/automake --add-missing
    '';

    meta = with stdenv.lib; {
      description = "The Silver Searcher is a tool for searching code";
      homepage = "http://geoff.greer.fm/ag/";
      license = licenses.asl20;
      platforms = platforms.unix;
    };
  };
}
