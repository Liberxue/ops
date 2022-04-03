resource "vultr_firewall_group" "strapi_app" {
  description = "Strapi Application firewall rules"
}

resource "vultr_firewall_rule" "app_tcp_22" {
  firewall_group_id = vultr_firewall_group.strapi_app.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "22"
  notes             = "ssh"
}


resource "vultr_firewall_rule" "app_tcp_8089" {
  firewall_group_id = vultr_firewall_group.strapi_app.id
  protocol          = "tcp"
  ip_type           = "v4"
  subnet            = "0.0.0.0"
  subnet_size       = 0
  port              = "8089"
  notes             = "ssr 8089"
}




resource "vultr_instance" "my_instance" {
  plan                   = var.one_cpu_one_gb_ram
  region                 = var.vultr_region
  #app_id                 = var.docker_centos
  os_id                 = var.instance_os
  label                  = "terraform ssr"
  enable_ipv6            = true
  backups                = "disabled"
  activation_email       = false
  ddos_protection        = false
  tag                    = "tag"
  hostname               = var.strapi_hostname
  firewall_group_id      = vultr_firewall_group.strapi_app.id
  ssh_key_ids            = [vultr_ssh_key.my_user.id]
  script_id              = vultr_startup_script.startup.id
}
#Create a new IPv4 address for a instance
#resource "vultr_instance_ipv4" "my_instance_ipv4" {
#    instance_id = "${vultr_instance.my_instance.id}"
#    reboot = "false"
#}

resource "vultr_startup_script" "startup" {
  name   = "boot_script"
  script = filebase64("scripts/boot_script.sh")
  type   = "boot"
}

resource "vultr_ssh_key" "my_user" {
  name    = "SSH key"
  ssh_key = file("sshkey.pub")
}

output "instance_ip" {
	  value = vultr_instance.my_instance.main_ip
}
