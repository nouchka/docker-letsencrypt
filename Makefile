DOCKER_IMAGE=letsencrypt
DOCKER_NAMESPACE=nouchka
TESTING_COMPOSE=docker-compose.wild.yml

.DEFAULT_GOAL := build

build:
	docker-compose -f $(TESTING_COMPOSE) build

check:
	docker run --rm -i hadolint/hadolint < Dockerfile 2>/dev/null; true

run:
	docker-compose -f $(TESTING_COMPOSE) up

down:
	docker-compose -f $(TESTING_COMPOSE) down --volumes --remove-orphans

test: build check run
