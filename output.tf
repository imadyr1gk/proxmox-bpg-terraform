output "vms_ipv4" {
  description = "IPv4 des VMs créées"
  value = {
    for vm_name, vm in proxmox_virtual_environment_vm.vm :
    vm_name => vm.ipv4_addresses
  }
}
#ip
