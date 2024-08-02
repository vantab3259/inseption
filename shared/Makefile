CREATE_VOLUMES	:= sudo mkdir -p /home/mudoh/data/mariadb_data /home/mudoh/data/wordpress_data

DOCKER_COMPOSE_FILE=/media/sf_shared/srcs/docker-compose.yml

CONTAINERS		:= $(shell docker ps -aq)
VOLUMES			:= $(shell docker volume ls -q)
IMAGES			:= $(shell docker image ls -aq)

build:
	$(CREATE_VOLUMES)
	docker-compose -f $(DOCKER_COMPOSE_FILE) up --build

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

clean: down
	if [ -n "$(CONTAINERS)" ]; then docker rm -f $(CONTAINERS); fi
	if [ -n "$(VOLUMES)" ]; then docker volume rm -f $(VOLUMES); fi
	if [ -n "$(IMAGES)" ]; then docker image rm -f $(IMAGES); fi
	docker system prune -a --volumes -f
	sudo rm -rf /home/mudoh/data/*


re: clean
	$(MAKE) build

revolume: down
	if [ -n "$(VOLUMES)" ]; then docker volume rm -f $(VOLUMES); fi
	sudo rm -rf /home/mudoh/data/*
	$(CREATE_VOLUMES)
	$(MAKE) build

logs:
	docker compose logs -f $(DOCKER_COMPOSE_FILE)

.PHONY: up build down clean re revolume logs