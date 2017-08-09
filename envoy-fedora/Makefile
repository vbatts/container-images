
DOCKER		?= $(shell which docker)
FROM_IMAGE	?= fedora
#FROM_TAG	?= 21
FROM_TAG	?= latest
FROM		:= $(FROM_IMAGE):$(FROM_TAG)
REGISTRY	?= docker.io
NAME		?= $(REGISTRY)/$(USER)/envoy-$(FROM_IMAGE):$(FROM_TAG)

default: build

Dockerfile: Dockerfile.in
	m4 \
	--define=FROM_IMAGE=$(FROM) \
	$< > $@

build: .build

.build: Dockerfile .pull
	$(DOCKER) build -t $(NAME) . && touch $@

pull: .pull

.pull:
	$(DOCKER) pull $(FROM) && touch $@

clean:
	rm -rf .build .pull Dockerfile *~


