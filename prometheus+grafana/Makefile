monitoring:
	make prometheus && make grafana

prometheus:
	ansible-playbook -i ../ansible/inventory.yml prometheus.yml

grafana:
	ansible-playbook -i ../ansible/inventory.yml grafana.yml --ask-vault-pass