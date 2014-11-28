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

  # hub alias
  alias git=hub

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

  . (rbenv init - --no-rehash | psub)
end

if status --is-interactive
  set -x DOCKER_HOST       tcp://192.168.59.103:2376
  set -x DOCKER_TLS_VERIFY 1
  set -x DOCKER_CERT_PATH  ~/.boot2docker/certs/boot2docker-vm
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
