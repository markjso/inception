LOGIN =		jmarks
DOMAIN =	${LOGIN}.42.fr

all: 
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build: 
	@bash srcs/requirements/wordpress/tools/make_dir.sh 
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	@docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

clean:	down
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress-data/*
	@sudo rm -rf ~/data/mariadb-data/*

fclean: 
	@docker system prune -f -a --volumes
	@docker volume rm srcs_mariadb-data srcs_wordpress-data
	@sudo rm -rf ~/data/wordpress-data/*
	@sudo rm -rf ~/data/mariadb-data/*

.PHONY: all build down clean fclean
