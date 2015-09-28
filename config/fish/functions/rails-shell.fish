function rails_shell -d "Start a nix-shell for rails development"
  rm -f qmake-rails-env/bin/qmake
  nix-shell -I ~/.nix-defexpr/channels ~/.rails-profile.nix
end
