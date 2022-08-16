REGISTRY_PREFIX ?= ccr.ccs.tencentyun.com/xunzhuo

IMAGES_DIR ?= $(wildcard ${ROOT_DIR}/build/docker/*)
IMAGES ?= $(foreach image,${IMAGES_DIR},$(notdir ${image}))

ifeq (${IMAGES},)
  $(error Could not determine IMAGES, set ROOT_DIR or run in source dir)
endif

.PHONY: image.build
image.build: $(addprefix image.build., $(IMAGES))

.PHONY: image.push
image.push: $(addprefix image.push., $(IMAGES))

.PHONY: image.build.%
image.build.%: go.build.linux_amd64.%
	@echo "===========> Building $* $(VERSION) docker image"
	rm -rf $(TMP_DIR)/$*
	mkdir -p $(TMP_DIR)/$*/bin
	cp ${OUTPUT_DIR}/linux/amd64/$* $(TMP_DIR)/$*/bin/
	docker build --platform linux/amd64 --pull -t $(REGISTRY_PREFIX)/$*:$(VERSION) -f $(ROOT_DIR)/build/docker/$*/Dockerfile $(TMP_DIR)/$*

.PHONY: image.push.%
image.push.%: image.build.%
	@echo "===========> Pushing $* $(VERSION) image to $(REGISTRY_PREFIX)"
	docker push $(REGISTRY_PREFIX)/$*:$(VERSION)
