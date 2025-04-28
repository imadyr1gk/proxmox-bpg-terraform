#data "proxmox_virtual_environment_vms" "debian-template" {
#  node_name = var.node_name
#  tags     = [var.template_debian_id]
#}

data "local_file" "ssh_public_key" {
  filename = ".id_rsa_pub_deploy"
}
# assurez voud de bien avoir le clé public qui sera déployé a la vm
