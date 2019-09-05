#!/usr/bin/env bats

#load bootstrap

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/deployment.json"

@test "return error code if not given a parameter" {
  run deployment-get-payload
  [ "$status" -eq 64 ]
}

@test "returns correct payload item" {
  run deployment-get-payload test_payload
  [ "$status" -eq 0 ]
  [ "$output" = "value" ]
}


@test "returns empty string if payload does not exist" {
  run deployment-get-payload foo_payload
  [ "$status" -eq 0 ]
  [ "$output" = "" ]
}
