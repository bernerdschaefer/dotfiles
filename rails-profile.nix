let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;
in rec {
  railsEnv = stdenv.mkDerivation rec {
    name = "rails-env";
    version = "0.1";
    src = ./.;
    buildInputs = [
      pkgs.nodejs
      pkgs.qt5.webkit
      pkgs.zlib
      pkgs.openssl
      pkgs.ruby_2_2
      pkgs.bundler
    ];
  };
}
