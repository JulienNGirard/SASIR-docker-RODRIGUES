DOCKER_REPO=sasir/lwimagercs

.PHONY: all build run force-build

all: build run

build:
	docker build -t ${DOCKER_REPO} .

force-build:
	docker build --pull -t $(IMAGE_NAME) --no-cache=true .

clean:
	docker rmi ${DOCKER_REPO}

run:
	docker run -v `pwd`/input:/input:ro -v `pwd`/output:/output:rw $(IMAGE_NAME) 

shell:
	docker run -ti -v `pwd`/input:/input:ro -v `pwd`/output:/output:rw $(IMAGE_NAME) bash
