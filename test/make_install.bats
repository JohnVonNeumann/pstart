@test "make install returns 0" {
  cd ../
  run make install
  [ "$status" -eq 0 ]
}
