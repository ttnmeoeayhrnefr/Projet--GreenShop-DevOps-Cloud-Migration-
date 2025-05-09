install-terraform:
	sudo apt-get -y update && sudo apt-get install -y gnupg software-properties-common
	wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
	gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $$(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
	sudo apt update
	sudo apt-get install terraform
	terraform -v

install-aws:
	@if aws --version > /dev/null 2>&1; then \
		sudo apt-get update -y && sudo apt-get install -y curl unzip; \
		curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"; \
		unzip /tmp/awscliv2.zip -d /tmp/ > /dev/null; \
		sudo /tmp/aws/install --update; \
	else \
		sudo apt-get update -y && sudo apt-get install -y curl unzip; \
		curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"; \
		unzip /tmp/awscliv2.zip -d /tmp/ > /dev/null; \
		sudo /tmp/aws/install; \
	fi
	@aws --version
	@rm -rf /tmp/awscliv2.zip
	@rm -rf /tmp/aws/

configure-aws:
	aws configure

configure-aws_session_token:
	aws configure set aws_session_token $(aws_session_token)

ipa: init plan apply

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply -auto-approve

destroy:
	terraform destroy -auto-approve