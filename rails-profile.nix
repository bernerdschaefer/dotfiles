let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;
in rec {
  railsEnv = stdenv.mkDerivation rec {
    name = "rails-env";
    version = "0.1";
    src = ./.;
    buildInputs = [
      pkgs.chruby
      pkgs.nodejs
      pkgs.qt5.qtwebkit
      pkgs.zlib
      pkgs.openssl
    ];

    shellHook = ''
      source ${pkgs.chruby}/share/chruby/chruby.sh
      source ${pkgs.chruby}/share/chruby/auto.sh
    '';
  };
}
