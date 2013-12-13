
NAME := docker.usersys/$(USER)/gccgo
DOCKER := $(shell which docker)

all: build

build: .build

.build: Dockerfile
	$(DOCKER) build -t $(NAME) . && touch $@

clean:
	rm -f .build $(wildcard *~)

