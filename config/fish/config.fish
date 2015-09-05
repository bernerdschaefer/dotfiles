if status --is-interactive
  set fish_greeting ""

  set -x EDITOR (which vim)
end

# Go configuration
set -x GOPATH ~
set -x PATH $GOPATH/bin $PATH

# Trust bin/ if .git/safe exists.
set -x PATH .git/safe/../../bin $PATH
