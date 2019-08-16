source /usr/local/lib/pstart/utils.sh

@test "function response with too little input" {
  run utils::file_integrity_check
  [ "$status" -ne 0 ]
  [ "$output" = "Error: Incorrect number of arguments." ]
}

@test "function response with too many inputs" {
  run utils::file_integrity_check fake1.txt fake2.txt >&3
  [ "$status" -ne 0 ]
  [ "$output" = "Error: Incorrect number of arguments." ]
}

@test "function returns 0 with correctly formatted file" {
  cd /tmp
  file="example.fake"
  touch $file
  run utils::file_integrity_check "$file"
  [ "$status" -eq 0 ]
}

@test "function errors with non-existent file input" {
  run utils::file_integrity_check not_exist.txt
  [ "$status" -ne 0 ]
  [ "$output" = "Error: not_exist.txt does not exist." ]
}

@test "function errors with non-empty file input" {
  file="dummy_file.txt"
  cd /tmp
  echo "test" > $file
  run utils::file_integrity_check dummy_file.txt
  [ "$status" -ne 0 ]
  [ "$output" = "Error: dummy_file.txt is not empty." ]
}
