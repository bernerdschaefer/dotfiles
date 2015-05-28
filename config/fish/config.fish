if status --is-interactive
  set fish_greeting ""

  set -x GOPATH ~

  # TODO: re-enable
  # alias git=hub

  set -x EDITOR (which vim)
end

# go setup
if status --is-interactive
  set -x GOPATH ~
  set -x GOROOT /usr/local/opt/go/libexec
  set -x PATH $PATH $GOPATH/bin $GOROOT/bin
end

# rbenv setup
if status --is-interactive
  set -x PATH $HOME/.rbenv/bin $PATH

  # TODO: re-enable ?
  # . (rbenv init - --no-rehash | psub)
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
