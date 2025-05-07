variable "allowed_ssh_ips" {
  description = "List of IP addresses allowed to SSH to admin instance"
  type        = list(string)
  default     = ["81.65.190.210/32", "82.64.129.73/32", "90.116.149.180/32", "176.149.32.2/32"]
}