terraform {
  required_version = ">= 1.5.7"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">= 2.9.14"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_tls_insecure = true
  pm_user         = var.pm_user
  pm_password     = var.home_lab_password
}

resource "proxmox_lxc" "ansible-01" {
  # provisioning from LXC template
  # -------------------------------
  ostemplate  = "nas-01_pve_isos_templates:vztmpl/rockylinux-9-default_20221109_amd64.tar.xz"
  ssh_public_keys = <<-EOT
    ${var.ssh_public_key}
  EOT
  # -------------------------------

  # provisioning from PVE clone
  # -------------------------------
  # clone = "104"
  # full  = true
  # -------------------------------

  target_node = "pve-01"
  hostname    = "ansible-01"
  cores       = 1
  memory      = 1024
  password    = var.home_lab_password
  start       = true
  onboot      = true

  rootfs {
    storage = "nas-01_pve_containers"
    size    = "4G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "172.21.0.2/24"
    gw     = "172.21.0.1"
  }

  # connection {
  #   type  = "ssh"
  #   user  = "root"
  #   host  = self.network[0].ip
  #   agent = true
  # }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo dnf update -y",
  #     "sudo dnf install epel-release -y",
  #     "sudo dnf install ansible -y",
  #     "sudo dnf install git -y",
  #     "sudo dnf install openssh-server -y",
  #     "sudo systemctl enable --now sshd",
  #   ]
  # }
}

resource "proxmox_vm_qemu" "rke-nodes" {
  
}