#!/usr/bin/env bats

readonly container="graze/migrate:latest"

@test "migrate version is correct" {
  run docker run --rm ${container} --version
  echo 'status:' $status
  echo 'output:' $output
  echo 'version:' $version
  [ "$status" -eq 0 ]
  [[ "$output" == 1.3.* ]]
  [[ "$output" != *-pre* ]]
}

@test "the image has migrate set as the entrypoint" {
  run bash -c "docker inspect ${container} | jq -r '.[]?.Config.Entrypoint[]?'"
  echo 'status:' $status
  echo 'output:' $output
  [ "$status" -eq 0 ]
  [ "$output" = "/go/bin/migrate" ]
}
