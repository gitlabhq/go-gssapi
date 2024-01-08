OS := $(shell uname | tr A-Z a-z)

ifeq (${OS}, darwin)
  BREW_PREFIX := $(shell brew --prefix 2>/dev/null || echo "/opt/homebrew")

  # To be able to compile gssapi library
  export CGO_CFLAGS="-I$(BREW_PREFIX)/opt/heimdal/include"
endif

.PHONY: test
test:
	go test -v ./...
