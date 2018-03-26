function fetch -d "Download an extract a file"
  set file $argv[1]

  switch "$file"
    case *.tar.gz
      curl -L "$file" | tar -zxv
    case *.tar.bz2
      curl -L "$file" | tar -jxv
    case *.zip
      curl -L "$file" > tmp.zip; and unzip tmp.zip; and rm tmp.zip
  end
end
