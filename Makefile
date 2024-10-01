VERSION  ?= latest
PLATFORM ?= linux/amd64

build:
	cd images/src/aws-terraform && \
	devcontainer build \
		--workspace-folder . \
		--platform $(PLATFORM) \
		--image-name bells17/devcontainer-aws-terraform:$(VERSION) \
		.devcontainer/devcontainer.json

push:
	docker push bells17/devcontainer-aws-terraform:$(VERSION)
