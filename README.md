# dotfiles

### Install

```
git clone https://github.com/bernerdschaefer/dotfiles \
  $HOME/src/github.com/bernerdschaefer/dotfiles
cd $HOME/src/github.com/bernerdschaefer/dotfiles
bin/setup
```

### Manage vim plugins

```
git remote add vim-foo https://github.com/owner/vim-foo
git subtree add --squash --prefix=vim/plugins/vim-foo vim-foo/master
```
