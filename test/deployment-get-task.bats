#!/usr/bin/env bats

PATH="$PATH:$BATS_TEST_DIRNAME/../bin"

export GITHUB_EVENT_PATH="$BATS_TEST_DIRNAME/fixtures/deployment.json"

@test "returs deployment task" {
  run deployment-get-task
  [ "$status" -eq 0 ]
  [ "$output" = "deploy" ]
}
