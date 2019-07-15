source ../lib/utils.sh

@test "function with correct file returns 0" {
  cd /tmp
  file="example.fake"
  touch $file
  run utils::file_integrity_check "$file"
  [ "$status" -eq 0 ]
}

