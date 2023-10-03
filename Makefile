.PHONY: make all

all: make

make:
	$(MAKE) -C packer all
	$(MAKE) -C terraform all
