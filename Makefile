DOCKER_IMAGE=letsencrypt
DOCKER_NAMESPACE=nouchka

.DEFAULT_GOAL := build

build:
	docker-compose build

check:
	docker run --rm -i hadolint/hadolint < Dockerfile 2>/dev/null; true

run:
	docker-compose up

down:
	docker-compose down --volumes --remove-orphans

test: build check run
