DOCKER_REPO=sasir/lwimagercs

.PHONY: docker-image clean

all: docker-image

docker-image:
	docker build -t ${DOCKER_REPO} .

clean:
	docker rmi ${DOCKER_REPO}

run: docker-image
	docker run -ti ${DOCKER_REPO} /bin/bash
