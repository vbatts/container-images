
DOCKER		?= $(shell which docker)
FROM_IMAGE	?= ubuntu
FROM_TAG	?= latest
FROM		:= $(FROM_IMAGE):$(FROM_TAG)
REGISTRY	?= docker.usersys
NAME		?= $(REGISTRY)/$(USER)/$(FROM_IMAGE)-dev:$(FROM_TAG)

default: build

Dockerfile: Dockerfile.in
	m4 --define=DEV_USER=$(USER) --define=FROM_IMAGE=$(FROM) $< > $@

build: .build

.build: Dockerfile .pull
	$(DOCKER) build -t $(NAME) . && touch $@

pull: .pull

.pull:
	$(DOCKER) pull $(FROM) && touch $@

clean:
	rm -rf .build .pull Dockerfile *~

