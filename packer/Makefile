.PHONY: packer all

all: packer

packer:
	packer init packer.pkr.hcl
	packer build -var-file variables.pkrvars.hcl packer.pkr.hcl