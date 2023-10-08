packer {
  required_plugins {
    proxmox = {
      version = ">= 1.1.5"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

variable "proxmox_url" {
  type    = string
  default = ""
}

variable "proxmox_username" {
  type    = string
  default = ""
}

variable "proxmox_password" {
  type    = string
  default = ""
}

variable "proxmox_node" {
  type    = string
  default = ""
}

variable "proxmox_iso_pool" {
  type    = string
  default = "nas-01_pve_isos_templates:iso"
}

variable "rocky_image" {
  type    = string
  default = "Rocky-9.2-x86_64-dvd.iso"
}

variable "proxmox_storage_pool" {
  type    = string
  default = "nas-01_pve_vm_disks"
}

variable "proxmox_storage_format" {
  type    = string
  default = "qcow2"
}

variable "template_name" {
  type    = string
  default = "rocky-9-cloud-init"
}

variable "template_description" {
  type    = string
  default = "Rocky Linux 9 with cloud-init"
}

variable "boot_command_ip" {
  type    = string
  default = "{{ .HTTPIP }}"
}

variable "boot_command_port" {
  type    = string
  default = "{{ .HTTPPort }}"
}

source "proxmox-iso" "rocky-9_2-x86_64" {
  proxmox_url              = "${var.proxmox_url}"
  insecure_skip_tls_verify = true
  node                     = "${var.proxmox_node}"
  http_directory           = "."
  boot_wait                = "10s"
  boot_command             = ["<tab> text inst.ks=http://${var.boot_command_ip}:${var.boot_command_port}/inst.ks<enter><wait>"]

  iso_file             = "${var.proxmox_iso_pool}/${var.rocky_image}"
  unmount_iso          = true
  template_name        = "${var.template_name}"
  template_description = "${var.template_description}"

  os              = "l26"
  cpu_type        = "x86-64-v2-AES"
  cores           = "2"
  memory          = "2048"
  scsi_controller = "virtio-scsi-single"

  username = "${var.proxmox_username}"
  password = "${var.proxmox_password}"

  cloud_init = false
  # cloud_init_storage_pool = "${var.proxmox_storage_pool}"

  ssh_port     = 22
  ssh_timeout  = "30m"
  ssh_username = "root"
  ssh_password = "Packer"

  disks {
    storage_pool = "${var.proxmox_storage_pool}"
    type         = "scsi"
    format       = "qcow2"
    disk_size    = "8G"
  }

  network_adapters {
    bridge = "vmbr0"
    model  = "virtio"
  }
}

build {
  name = "rocky-9_2-x86_64-cloud-init"

  sources = ["source.proxmox-iso.rocky-9_2-x86_64"]

  provisioner "shell" {
    inline = [
      "yum install -y cloud-init qemu-guest-agent cloud-utils-growpart gdisk",
      "systemctl enable qemu-guest-agent",
      "shred -u /etc/ssh/*_key /etc/ssh/*_key.pub",
      "rm -f /var/run/utmp", ">/var/log/lastlog",
      ">/var/log/wtmp", ">/var/log/btmp",
      "rm -rf /tmp/* /var/tmp/*",
      "unset HISTFILE; rm -rf /home/*/.*history /root/.*history",
      "rm -f /root/*ks",
      "passwd -d root",
      "passwd -l root",
      "rm -f /etc/ssh/ssh_config.d/allow-root-ssh.conf",
      ]
  }
}
