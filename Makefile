install:
	cd terraform && make install-terraform
	cd terraform && make install-aws
	cd ansible && make install-ansible
	cd ansible && make requirements

configure:
	cd terraform && make configure-aws

configure-aws_session_token:
	cd terraform && make configure-aws_session_token

greenshop:
	cd terraform && make ipa
	sleep 300
	cd ansible && make greenshop
	cd prometheus+grafana && make monitoring