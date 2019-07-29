source /usr/local/lib/pstart/utils.sh

@test "function response with no file" {
  run utils::file_integrity_check
  [ "$status" -ne 0 ]
  [ "$output" = "Error: Input cannot be empty." ]
}

@test "function with correct file returns 0" {
  cd /tmp
  file="example.fake"
  touch $file
  run utils::file_integrity_check "$file"
  [ "$status" -eq 0 ]
}

