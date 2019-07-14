source ../pstart.sh

@test "function creates file correctly" {
  cd /tmp
  create_makefile
  [ -f "/tmp/makefile" ]
}
