# # nix setup (currently disabled)
# if status --is-login
#   set -l nix_link "$HOME/.nix-profile"
#
#   set -x PATH $nix_link/bin $nix_link/sbin $PATH
#   set -x NIX_PATH $NIX_PATH nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs
#
#   set -x GOROOT "$HOME/.nix-profile/share/go"
# end

if status --is-login
  set fish_greeting ""

  set -x GOPATH ~
  set -x PATH $PATH $GOPATH/bin

  # hub alias
  alias git=hub

  set -x EDITOR (which vim)
end

# set up rbenv
if status --is-interactive
  set -x PATH $HOME/.rbenv/bin $PATH

  . (rbenv init - --no-rehash | psub)
end

function fish_user_key_bindings
  bind \e. 'history-token-search-backward'
end

function grep
  command grep --color=auto $argv
end

# Simple polymorphic download function
function fetch()
  switch $1
    case *.tar.gz
      curl -L $1 | tar -zxv
    case *.tar.bz2
      curl -L $1 | tar -jxv
    case *.zip
      curl -L $1 > tmp.zip; and unzip tmp.zip; and rm tmp.zip
  end
end
