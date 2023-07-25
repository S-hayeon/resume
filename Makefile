VERSION ?= v2.0.6


REGISTRY ?= hayeona92


resume ?= $(REGISTRY)/resumes:$(VERSION)

# Build the docker image
.PHONY: docker-build
docker-build: docker-build-resume

.PHONY: docker-push
docker-push: docker-push-resume

.PHONY: deploy
deploy: docker-build docker-push

docker-build-resume:
	docker build . --platform linux/amd64 -t ${resume}

docker-push-resume:
	docker push ${resume}

