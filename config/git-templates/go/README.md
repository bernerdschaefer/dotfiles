# git-templates/go

This is a [git-template][] for Go projects; it should be general enough to work as
a starting point for any new or existing Go project.

```shell
# clone with template
git clone --template ~/.config/git-template/go \
  https://github.com/foo/bar

# apply template to existing project
cd src/github.com/foo/bar &&
  git init --template ~/.config/git-templates/go
```

[git-template]: http://git-scm.com/docs/git-init#_template_directory

## What's inside?

  * `hooks/pre-commit`: rejects commits which require reformatting or fail "go
    vet".
  * `hooks/prepare-commit-msg`: annotates commit message with any golint
    warnings.
