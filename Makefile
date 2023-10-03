.PHONY: make all

all: make

make:
	$(MAKE) -C packer all
	sleep 30
	$(MAKE) -C terraform all
