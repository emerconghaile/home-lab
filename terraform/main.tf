terraform {
  required_version = ">= 1.4.5"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">= 2.9.14"
    }
  }
}
