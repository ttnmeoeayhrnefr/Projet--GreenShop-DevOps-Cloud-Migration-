resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tftpl", {
    admin_ip = aws_instance.GreenShop-INSTANCE-ADM.public_ip,
    rproxy_ip = aws_instance.GreenShop-INSTANCE-RPROXY.public_ip,
    jenkins_ip = aws_instance.GreenShop-INSTANCE-JENKINS.public_ip,
    prometheus_ip = aws_instance.GreenShop-INSTANCE-PROMETHEUS.public_ip,
    grafana_ip = aws_instance.GreenShop-INSTANCE-GRAFANA.public_ip,
    web1_private_ip = aws_instance.GreenShop-INSTANCE-WEB1.private_ip,
    web2_private_ip = aws_instance.GreenShop-INSTANCE-WEB2.private_ip,
    web3_private_ip = aws_instance.GreenShop-INSTANCE-WEB3.private_ip,
    db_private_ip = aws_instance.GreenShop-INSTANCE-DB1.private_ip
  })
  filename = "${path.module}/../ansible/inventory.yml"
  
  provisioner "local-exec" {
    command = "mkdir -p ${path.module}/../ansible"
  }
  
  depends_on = [
    aws_instance.GreenShop-INSTANCE-ADM,
    aws_instance.GreenShop-INSTANCE-RPROXY,
    aws_instance.GreenShop-INSTANCE-WEB1,
    aws_instance.GreenShop-INSTANCE-WEB2,
    aws_instance.GreenShop-INSTANCE-WEB3,
    aws_instance.GreenShop-INSTANCE-DB1,
    aws_instance.GreenShop-INSTANCE-JENKINS,
    aws_instance.GreenShop-INSTANCE-PROMETHEUS,
    aws_instance.GreenShop-INSTANCE-GRAFANA
  ]
}