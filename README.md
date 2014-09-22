```
# install nix packages
nix-env -f ./profile.nix -i '*'

# install dotfiles
env RCRC=./src/github.com/bernerdschaefer/dotfiles/rcrc rcup

# set fish as default shell
_fish=$HOME/.nix-profile/bin/fish

grep -q "$_fish" /etc/shells || {
  echo "$_fish" | sudo tee -a /etc/shells > /dev/null
}

chsh -s "$_fish"
```
