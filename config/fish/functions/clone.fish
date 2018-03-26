function clone -d "Clone a repo into GOPATH"
  set repo $argv[1]
  set dir "$HOME"/src/github.com/"$repo"

  if test -d "$dir"
    env GIT_DIR="$dir/.git" git fetch
  else
    hub clone "$repo" "$dir"
  end

  cd "$dir"
end
