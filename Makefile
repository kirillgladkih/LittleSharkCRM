config:
	cp ./docker/.env.example ./docker/.env
	cp ./application/.env.example ./application/.env
build:
	cd docker && docker compose build --no-cache
run:
	cd docker && docker compose up -d
down:
	cd docker && docker compose down
con:
	docker exec -it little_shark_crm-fpm-1 /bin/sh