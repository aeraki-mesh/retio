VERSION_PACKAGE=github.com/aeraki-mesh/retio/pkg/app/version

SHELL := /bin/bash

DEPLOYS := retio

include build/lib/common.mk
include build/lib/help.mk
include build/lib/golang.mk
include build/lib/image.mk
include build/lib/deploy.mk

.PHONY: all
all: check lint test build

.PHONY: build
build:
	@make go.build

.PHONY: build.multiarch
build.multiarch:
	@make go.build.multiarch
	
.PHONY: clean
clean:
	@make go.clean
	
.PHONY: lint
lint:
	@make go.lint

.PHONY: help
help:
	@echo "$$HELPTEXT"

.PHONY: test
test:
	@make go.test

.PHONY: image
image:
	@make image.build

.PHONY: push
push:
	@make image.push

.PHONY: deploy
deploy:
	@make deploy.run

.PHONY: check
check:
	@make go.check

.PHONY: release
release:
		tag=$$(TZ=UTC git --no-pager show \
                     --quiet \
                     --abbrev=8 \
                     --date='format-local:%Y%m%d' \
                     --format="%cd-%h") && git tag -f $$tag && git push origin $$tag