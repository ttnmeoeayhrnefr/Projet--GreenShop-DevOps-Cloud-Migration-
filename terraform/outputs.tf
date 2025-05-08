output "admin_public_ip" {
  value = aws_instance.GreenShop-INSTANCE-ADM.public_ip
}

output "rproxy_public_ip" {
  value = aws_instance.GreenShop-INSTANCE-RPROXY.public_ip
}

output "jenkins_public_ip" {
  value = aws_instance.GreenShop-INSTANCE-JENKINS.public_ip
}

output "prometheus_public_ip" {
  value = aws_instance.GreenShop-INSTANCE-PROMETHEUS.public_ip
}

output "grafana_public_ip" {
  value = aws_instance.GreenShop-INSTANCE-GRAFANA.public_ip
}

output "web1_private_ip" {
  value = aws_instance.GreenShop-INSTANCE-WEB1.private_ip
}

output "web2_private_ip" {
  value = aws_instance.GreenShop-INSTANCE-WEB2.private_ip
}

output "web3_private_ip" {
  value = aws_instance.GreenShop-INSTANCE-WEB3.private_ip
}

output "db_private_ip" {
  value = aws_instance.GreenShop-INSTANCE-DB1.private_ip
}