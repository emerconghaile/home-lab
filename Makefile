.PHONY: packer terraform all

all: packer terraform

packer:
	packer init packer/packer.pkr.hcl
	packer build -var-file packer/variables.pkrvars.hcl packer/packer.pkr.hcl

terraform:
	terraform -chdir=terraform init
	terraform -chdir=terraform apply -auto-approve
