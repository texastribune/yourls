.PHONY: build push

PREFIX ?= texastribune/yourls
TAG ?= latest
DB_USER:= {{ db_user }}
DB_PASS:= {{ db_pass }}
DB_NAME:= {{ db_name }}
DB_HOST:= {{ db_host }}
SITE:= {{ site }}
COOKIE_KEY:= {{ cookie_key }}
YOURLS_USERS:= {{ yourls_users }}

build:
	docker build -t $(PREFIX):$(TAG) .

run:
	docker run \
		-e YOURLS_DB_USER=${DB_USER} \
		-e YOURLS_DB_PASS=${DB_PASS} \
		-e YOURLS_DB_NAME=${DB_NAME} \
		-e YOURLS_DB_HOST=${DB_HOST}\
		-e YOURLS_DB_PREFIX=yourls_ \
		-e YOURLS_SITE=${SITE} \
		-e YOURLS_COOKIEKEY=${COOKIE_KEY} \
		-e YOURLS_USERS=${YOURLS_USERS} \
		-it texastribune/yourls
