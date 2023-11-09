.PHONY: build test run

build:
	mdbook build

test:
	mdbook test

run:
	mdbook serve
