build:
	docker build -t nrm-shiny:v2 . 

build-2:
	docker build -t ingimar/nrm-shiny:v3 .

run:
	docker run -dp 8080:8080 nrm-shiny

# docker-commit:

docker-push:
	docker push quay.io/ingimar/nrm-shiny:v3

mysql-login:
	    docker exec -it mysql bash

up:
	docker-compose up -d


