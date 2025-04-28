resource "proxmox_virtual_environment_vm" "vm" {
  for_each  = toset(var.vm_names)
  name      = each.key
  node_name = var.node_name
  vm_id     = 900 + index(var.vm_names, each.key)
  clone {
    # vm_id = data.proxmox_virtual_environment_vms.debian-template.vms[0].vm_id
    vm_id = 9000
    full  = true
  }
  initialization {
    datastore_id = "local"

    user_account {
      username = "imad"
      password = "mot-de-passe-haché"
# mot passe haché avec openssl passwd -6 mon-mot-de-passe
# assurez vous d'avoir la clé ( déclarer dans le data source )
      keys     = [trimspace(data.local_file.ssh_public_key.content)]

    }
    dns {
      domain  = "local"
      servers = ["1.1.1.1"]
    }
    ip_config {
      ipv4 {
        address = "192.168.3.${50 + index(var.vm_names, each.key)}/24"
        gateway = "192.168.3.1"
      }
    }
  }
  lifecycle {
    ignore_changes = [
      # ignore toute mise à jour sur ces attributs pour les VMs existantes
      initialization[0].ip_config[0].ipv4[0].address,
      initialization[0].ip_config[0].ipv4[0].gateway,
      network_device,
      disk,
      memory,
      cpu
    ]
  }

  #  prevent_destroy = true

}
