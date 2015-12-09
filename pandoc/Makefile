
DOCKER ?= $(shell which docker)

default:
	$(DOCKER) build -t $(shell whoami)/pandoc .

tag:
	$(DOCKER) tag $(shell whoami)/pandoc $(shell whoami)/pandoc:$(shell $(DOCKER) run -it --entrypoint /usr/bin/rpm $(shell whoami)/pandoc -q --queryformat "%{version}-%{release}.%{arch}" pandoc)

