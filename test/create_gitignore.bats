source ../pstart.sh

@test "function creates file correctly" {
  cd /tmp
  create_gitignore
  [ -f "/tmp/.gitignore" ]
}

@test "function picks up 
