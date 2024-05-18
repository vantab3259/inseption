DOCKER_COMPOSE_FILE=/media/sf_shared/srcs/docker-compose.yml

up:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up --build

down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down