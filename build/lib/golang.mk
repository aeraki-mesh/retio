PLATFORM ?= $(shell go env GOOS)_$(shell go env GOARCH)
COMMANDS ?= $(wildcard ${ROOT_DIR}/cmd/*)
ifeq (${COMMANDS},)
  $(error Could not determine COMMANDS, set ROOT_DIR or empty in ${ROOT_DIR}/cmd/)
endif
BINS ?= $(foreach cmd,${COMMANDS},$(notdir ${cmd}))
ifeq (${BINS},)
  $(error Could not determine BINS, set ROOT_DIR or empty in ${ROOT_DIR}/cmd/)
endif

GO_MIN_VERSION := 1.14
GOLANGCI_LINT_VERSION := v1.46.2
GO_LDFLAGS += -X $(VERSION_PACKAGE).GitVersion=$(VERSION) \
	-X $(VERSION_PACKAGE).GitCommit=$(GIT_COMMIT) \
	-X $(VERSION_PACKAGE).GitTreeState=$(GIT_TREE_STATE) \
	-X $(VERSION_PACKAGE).BuildDate=$(shell date -u +'%Y-%m-%dT%H:%M:%SZ')
GOOS := $(word 1, $(subst _, ,$(PLATFORM)))
GOARCH := $(word 2, $(subst _, ,$(PLATFORM)))
GOPATH := $(shell go env GOPATH)
GOBIN := $(GOPATH)/bin

ifeq ($(GOOS),windows)
	GO_OUT_EXT := .exe
endif

.PHONY: go.build
go.build: go.build.verify $(addprefix go.build., $(addprefix $(PLATFORM)., $(BINS)))

.PHONY: go.build.verify
go.build.verify:
ifneq ($(shell printf '%s\ngo%s\n' $$(go version | grep -oE 'go[0-9.]+') $(GO_MIN_VERSION) | sort -rCV; echo $$?), 0)
	$(error go version must not less than $(GO_MIN_VERSION))
endif

.PHONY: go.build.%
go.build.%:
	@echo "===========> Run $@"
	$(eval COMMAND := $(word 2,$(subst ., ,$*)))
	$(eval PLATFORM := $(word 1,$(subst ., ,$*)))
	$(eval OS := $(word 1,$(subst _, ,$(PLATFORM))))
	$(eval ARCH := $(word 2,$(subst _, ,$(PLATFORM))))
	@echo "===========> Building binary $(COMMAND) $(VERSION) for $(OS) $(ARCH)"
	@mkdir -p $(OUTPUT_DIR)/$(OS)/$(ARCH)
	cd cmd/$(COMMAND) && CGO_ENABLED=0 GOOS=$(OS) GOARCH=$(ARCH) go build -o $(OUTPUT_DIR)/$(OS)/$(ARCH)/$(COMMAND)$(GO_OUT_EXT) -ldflags "$(GO_LDFLAGS)"

.PHONY: go.build.multiarch
go.build.multiarch:  $(foreach p,$(PLATFORMS),$(addprefix go.build., $(addprefix $(p)., $(BINS))))

.PHONY: go.clean
go.clean:
	@echo "===========> Run $@"
	rm -rf $(OUTPUT_DIR)

.PHONY: go.lint
go.lint: go.lint.verify
	@echo "===========> Run $@"
	golangci-lint run

.PHONY: go.lint.verify
go.lint.verify: go.build.verify
ifeq (,$(shell which golangci-lint))
	@echo "===========> Installing golangci lint"
	curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(GOBIN) $(GOLANGCI_LINT_VERSION)
endif

.PHONY: go.test
go.test:
	@echo "===========> Run $@"
	go test -timeout=10m -short -v ./...

.PHONY: go.check
go.check:
	@echo "===========> Run $@"
	@go mod tidy
	@if git status -s | grep -E 'go(.mod)|go(.sum)' ; then \
   		echo 'Error: must run `go mod tidy` before commit!'; \
   		exit 1; \
   	fi
