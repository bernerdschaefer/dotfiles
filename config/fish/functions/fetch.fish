function fetch -d "Download an extract a file"
  switch $1
    case *.tar.gz
      curl -L $1 | tar -zxv
    case *.tar.bz2
      curl -L $1 | tar -jxv
    case *.zip
      curl -L $1 > tmp.zip; and unzip tmp.zip; and rm tmp.zip
  end
end
