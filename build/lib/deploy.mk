NAMESPACE ?= $(USER)
CONTEXT ?= monitor.tcm
KUBECTL := kubectl -n${NAMESPACE} --context=${CONTEXT}

DEPLOYS_DIR ?= $(wildcard ${ROOT_DIR}/cmd/*)
DEPLOYS ?= $(foreach one,${DEPLOYS_DIR},$(notdir ${one}))

.PHONY: deploy.run
deploy.run: $(addprefix deploy.run., $(DEPLOYS))

.PHONY: deploy.run.%
deploy.run.%:
	@echo "===========> Deploying $* $(VERSION) for $(USER)"
	cat deploy/$*/$*.yaml | \
		sed "s;USER;${USER};g" | \
		sed "s;VERSION;${VERSION};g" | \
		$(KUBECTL) apply -f -