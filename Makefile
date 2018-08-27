PREFIX ?= texastribune/yourls
TAG ?= latest

run: build db
	-docker rm -f yourls
	docker run --name yourls --publish=80:80 --net=yourls-net --env-file=env -it texastribune/yourls

build:
	docker build -t $(PREFIX):$(TAG) .

net:
	-docker network create yourls-net

db: net
	-docker stop mysql
	docker start mysql 2>/dev/null || \
		docker run --rm -d --env-file=env \
		--net=yourls-net \
		--volume=$$(pwd)/mysql-data:/var/lib/mysql/ \
		--name mysql mysql:5.6.39

