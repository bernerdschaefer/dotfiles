```
# install dotfiles
env RCRC=~/src/github.com/bernerdschaefer/dotfiles/rcrc rcup
```

### Manage vim plugins

```
git remote add vim-foo https://github.com/owner/vim-foo
git subtree add --squash --prefix=vim/plugins/vim-foo vim-foo/master
```
