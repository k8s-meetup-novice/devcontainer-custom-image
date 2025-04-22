VERSION      ?= latest
PLATFORM     ?= linux/amd64
AWS_IMAGE    ?= ghcr.io/mochizuki875/devcontainer-custom-image/devcontainer-aws-terraform
GCLOUD_IMAGE ?= ghcr.io/mochizuki875/devcontainer-custom-image/devcontainer-gcloud-terraform

build-aws:
	cd images/src/aws-terraform && \
	devcontainer build \
		--workspace-folder . \
		--platform $(PLATFORM) \
		--image-name $(AWS_IMAGE):$(VERSION) \
		.devcontainer/devcontainer.json
build-gcloud:
	cd images/src/gcloud-terraform && \
	devcontainer build \
		--workspace-folder . \
		--platform $(PLATFORM) \
		--image-name $(GCLOUD_IMAGE):$(VERSION) \
		.devcontainer/devcontainer.json

push-aws:
	docker push $(AWS_IMAGE):$(VERSION)

push-gcloud:
	docker push $(GCLOUD_IMAGE):$(VERSION)