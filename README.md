Déploiement de VMs sur un proxmox avec terraform en utilisant le provider terraform-bpg

Créer le user terraform sur proxmox. Détails ici : https://registry.terraform.io/providers/bpg/proxmox/latest/docs#api-token-authentication

Ensuite définir les variables d'environnement :

export PROXMOX_VE_ENDPOINT="https://proxmox.lab.prod:8006/"

export PROXMOX_VE_INSECURE=false

export PROXMOX_VE_USERNAME="terraform-uer-proxmox@pve"

export PROXMOX_VE_PASSWORD="user-proxmox-x"
