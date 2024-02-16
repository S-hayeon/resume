VERSION ?= v8.0.0


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
	if [ `uname -m` = "arm64" ]; then \
	    docker build . --platform linux/amd64 -t ${resume}; \
	else \
	    docker build . -t ${resume}; \
	fi

docker-push-resume:
	docker push ${resume}

