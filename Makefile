.PHONY: all push

SHELL = /bin/bash
VERSION ?= latest

all: build

build: Dockerfile start.sh read-secrets.sh
	docker build --tag cch1/datomic-free:$(VERSION) .

push:
	docker push cch1/datomic-free:$(VERSION)
