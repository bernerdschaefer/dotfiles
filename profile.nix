let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;
in rec {
  git = pkgs.git;
  hub = pkgs.gitAndTools.hub;

  go = pkgs.go_1_4;
  fish = pkgs.fish;

  mercurial = pkgs.mercurial;
  cloc = pkgs.cloc;
  ctags = pkgs.ctags;

  silver-searcher = pkgs.silver-searcher;

  heroku = pkgs.callPackage ./nix/heroku-toolbelt {};

  parity = pkgs.callPackage ./nix/parity {
    heroku = heroku;
  };

  gitsh = pkgs.callPackage ./nix/gitsh {};

  rcm = stdenv.mkDerivation rec {
    name = "rcm-${version}";
    version = "1.2.3";

    src = pkgs.fetchurl {
      url = "https://thoughtbot.github.io/rcm/dist/rcm-1.2.3.tar.gz";
      sha256 = "502fd44e567ed0cfd00fb89ccc257dac8d6eb5d003f121299b5294c01665973f";
    };

    meta = with stdenv.lib; {
      description = "rc file (dotfile) management";
      homepage = "http://thoughtbot.github.io/rcm";
      license = licenses.bsd3;
      platforms = platforms.unix;
    };
  };
}
