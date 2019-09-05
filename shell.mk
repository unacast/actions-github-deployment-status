SHELL_FILES=$(filter-out bin/JSON.sh, $(wildcard *.sh */*.sh bin/deployment-*))
BATS_TESTS=$(wildcard *.bats */*.bats)

.PHONY: shell-lint
shell-lint:
	shellcheck $(SHELL_FILES)

.PHONY: shell-test
shell-test:
	bats $(BATS_TESTS)