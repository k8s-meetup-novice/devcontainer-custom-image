VERSION  ?= latest
PLATFORM ?= linux/amd64
IMAGE    ?= ghcr.io/bells17/devcontainer-custom-image/devcontainer-aws-terraform

build:
	cd images/src/aws-terraform && \
	devcontainer build \
		--workspace-folder . \
		--platform $(PLATFORM) \
		--image-name $(IMAGE):$(VERSION) \
		.devcontainer/devcontainer.json

push:
	docker push $(IMAGE):$(VERSION)
