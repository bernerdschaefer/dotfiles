if status --is-interactive
  set fish_greeting ""

  # TODO: re-enable
  # alias git=hub

  set -x EDITOR (which vim)
end

# go setup
if status --is-interactive
  set -x GOPATH ~
  set -x GOROOT ~/.nix-profile/share/go
  set -x PATH $PATH $GOPATH/bin $GOROOT/bin
end

set -x PATH .git/safe/../../bin $PATH

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
