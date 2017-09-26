.PHONY: build push

PREFIX ?= texastribune/yourls
TAG ?= latest

build:
	docker build -t $(PREFIX):$(TAG) .

push: build
	docker push $(PREFIX):$(TAG)
