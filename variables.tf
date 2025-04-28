variable "node_name" {
  description = "proxmox pa"
  default     = "prox"
}

variable "template_debian_id" {
  description = " template debian de proxmox"
  default     = "9000"
}

variable "nb_vms" {
  description = "nombre de vms à créer"

}

variable "vm_names" {
  description = "nom des vm"
  type        = list(string)
  default     = ["vm1", "vm2", "vm3"]
}
