SHELL = /bin/bash

EXECUTABLES = docker bats jq
CHECK := $(foreach executable,$(EXECUTABLES),\
	$(if $(shell which $(executable)),"",$(error "No executable found for $(executable).")))

build:
	docker build -t graze/migrate .

test:
	./test.bats
