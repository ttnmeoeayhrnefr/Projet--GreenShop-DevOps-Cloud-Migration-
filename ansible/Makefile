install-ansible:
	sudo apt update && sudo apt install -y software-properties-common
	sudo add-apt-repository --yes --update ppa:ansible/ansible
	sudo apt install -y ansible
	ansible --version

requirements:
	ansible-galaxy install --force -r requirements.yml

playbook:
	ansible-playbook -i inventory.yml playbook.yml