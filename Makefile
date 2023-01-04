VERSION ?= v1.0.0


REGISTRY ?= hayeona92


resume ?= $(REGISTRY)/resumes:$(VERSION)

# Build the docker image
.PHONY: docker-build
docker-build: docker-build-resume

.PHONY: docker-push
docker-push: docker-push-resume


docker-build-resume:
	docker build . --platform linux/amd64 -t ${resume}

docker-push-resume:
	docker push ${resume}