install-ansible:
	sudo apt update -y && sudo apt install -y software-properties-common
	sudo add-apt-repository --yes --update ppa:ansible/ansible
	sudo apt install -y ansible
	ansible --version

requirements:
	ansible-galaxy install --force -r requirements.yml

greenshop:
	ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i inventory.yml greenshop.yml --ask-vault-pass

ssh-adm1:
	$(eval ADM1_HOST := $(shell ansible-inventory -i ./inventory.yml --host adm1 | jq -r '.ansible_host'))
	$(eval ADM1_USER := $(shell ansible-inventory -i ./inventory.yml --host adm1 | jq -r '.ansible_user'))
	$(eval ADM1_KEY := $(shell ansible-inventory -i ./inventory.yml --host adm1 | jq -r '.ansible_ssh_private_key_file'))
	ssh -i $(ADM1_KEY) $(ADM1_USER)@$(ADM1_HOST)

ssh-rproxy1:
	$(eval RPROXY1_HOST := $(shell ansible-inventory -i ./inventory.yml --host rproxy1 | jq -r '.ansible_host'))
	$(eval RPROXY1_USER := $(shell ansible-inventory -i ./inventory.yml --host rproxy1 | jq -r '.ansible_user'))
	$(eval RPROXY1_KEY := $(shell ansible-inventory -i ./inventory.yml --host rproxy1 | jq -r '.ansible_ssh_private_key_file'))
	ssh -i $(RPROXY1_KEY) $(RPROXY1_USER)@$(RPROXY1_HOST)

ssh-web1:
	$(eval WEB1_HOST := $(shell ansible-inventory -i ./inventory.yml --host web1 | jq -r '.ansible_host'))
	$(eval WEB1_USER := $(shell ansible-inventory -i ./inventory.yml --host web1 | jq -r '.ansible_user'))
	$(eval WEB1_KEY := $(shell ansible-inventory -i ./inventory.yml --host web1 | jq -r '.ansible_ssh_private_key_file'))
	$(eval PROXY_CMD := $(shell ansible-inventory -i ./inventory.yml --host web1 | jq -r '.ansible_ssh_common_args'))
	ssh $(PROXY_CMD) -i $(WEB1_KEY) $(WEB1_USER)@$(WEB1_HOST)

ssh-web2:
	$(eval WEB2_HOST := $(shell ansible-inventory -i ./inventory.yml --host web2 | jq -r '.ansible_host'))
	$(eval WEB2_USER := $(shell ansible-inventory -i ./inventory.yml --host web2 | jq -r '.ansible_user'))
	$(eval WEB2_KEY := $(shell ansible-inventory -i ./inventory.yml --host web2 | jq -r '.ansible_ssh_private_key_file'))
	$(eval PROXY_CMD := $(shell ansible-inventory -i ./inventory.yml --host web2 | jq -r '.ansible_ssh_common_args'))
	ssh $(PROXY_CMD) -i $(WEB2_KEY) $(WEB2_USER)@$(WEB2_HOST)

ssh-web3:
	$(eval WEB3_HOST := $(shell ansible-inventory -i ./inventory.yml --host web3 | jq -r '.ansible_host'))
	$(eval WEB3_USER := $(shell ansible-inventory -i ./inventory.yml --host web3 | jq -r '.ansible_user'))
	$(eval WEB3_KEY := $(shell ansible-inventory -i ./inventory.yml --host web3 | jq -r '.ansible_ssh_private_key_file'))
	$(eval PROXY_CMD := $(shell ansible-inventory -i ./inventory.yml --host web3 | jq -r '.ansible_ssh_common_args'))
	ssh $(PROXY_CMD) -i $(WEB3_KEY) $(WEB3_USER)@$(WEB3_HOST)

ssh-db1:
	$(eval DB1_HOST := $(shell ansible-inventory -i ./inventory.yml --host db1 | jq -r '.ansible_host'))
	$(eval DB1_USER := $(shell ansible-inventory -i ./inventory.yml --host db1 | jq -r '.ansible_user'))
	$(eval DB1_KEY := $(shell ansible-inventory -i ./inventory.yml --host db1 | jq -r '.ansible_ssh_private_key_file'))
	$(eval PROXY_CMD := $(shell ansible-inventory -i ./inventory.yml --host db1 | jq -r '.ansible_ssh_common_args'))
	ssh $(PROXY_CMD) -i $(DB1_KEY) $(DB1_USER)@$(DB1_HOST)

forget:
	ssh-keygen -f '/home/theo/.ssh/known_hosts' -R '10.0.2.5'
	ssh-keygen -f '/home/theo/.ssh/known_hosts' -R '10.0.3.5'
	ssh-keygen -f '/home/theo/.ssh/known_hosts' -R '10.0.4.5'
	ssh-keygen -f '/home/theo/.ssh/known_hosts' -R '10.0.5.5'