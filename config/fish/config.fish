if status --is-login
  set -l nix_link "$HOME/.nix-profile"

  set -x PATH $nix_link/bin $nix_link/sbin $PATH
  set -x NIX_PATH $NIX_PATH nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs
end

if status --is-login
  set fish_greeting ""

  set -x GOPATH ~
  set -x PATH $PATH $GOPATH/bin

  set -x GOROOT "$HOME/.nix-profile/share/go"

  # Basic path setup
  set -x PATH /usr/local/Cellar/ruby/1.9.3-p286/bin $PATH
  set -x PATH /usr/local/share/npm/bin $PATH

  # Set up Vim
  alias vim="/usr/local/Cellar/macvim/7.3-65/MacVim.app/Contents/MacOS/Vim"

  set -x EDITOR /usr/local/Cellar/macvim/7.3-65/MacVim.app/Contents/MacOS/Vim

  # hub alias
  alias git=hub
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
