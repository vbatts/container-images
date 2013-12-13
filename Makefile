
all := \
	fedora \
	ubuntu

#centos

default: $(all)
	

fedora:
	cd $@-dev && $(MAKE)

ubuntu:
	cd $@-dev && $(MAKE)

centos:
	cd $@-dev && $(MAKE)

.PHONY: fedora ubuntu centos

clean: 
	for d in fedora ubuntu centos; do (cd $$d-dev && $(MAKE) clean); done

