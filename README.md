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

### Manage vim plugins

```
git remote add uarun/vim-protobuf https://github.com/uarun/vim-protobuf
git subtree add --squash --prefix=vim/plugins/vim-protobuf uarun/vim-protobuf/master

git remote add mikewest/vimroom https://github.com/mikewest/vimroom
git subtree add --squash --prefix=vim/plugins/vimroom mikewest/vimroom/master
```
