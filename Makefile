#!/usr/bin/env bash

.ONESHELL:

.PHONY: infra_oci
infra_oci:
	cd oci/
	terraform init
	terraform apply -auto-approve

.PHONY: destroy_oci
destroy_oci:
	cd oci/
	terraform destroy

.PHONY: joomla
joomla:
	ansible-galaxy install -r requirements.yaml
	ansible-playbook -i dynamic_inventory.py joomla_install.yaml
	
.PHONY: output
output:
	cd oci/
	terraform output public_ip

.PHONY: all
all: infra_oci joomla
