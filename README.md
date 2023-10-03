# home-lab

# Infrastructure
- (x3) Proxmox nodes
- a RAID-5 NAS

# [Packer](packer/) templates
- download ISOs to Proxmox storage
  - [Rocky-9.2-x86_64-dvd.iso](http://dl.rockylinux.org/pub/rocky/9.2/isos/x86_64/Rocky-9.2-x86_64-dvd.iso)
- if running Packer from WSL2
  - in [variables.pkrvars.hcl](packer/variables.pkrvars.hcl)
    - set `boot_command_ip` to Windows host IP address
    - optionally, set `boot_command_port` to an unused port (defaults to random port)
  - in elevated PowerShell, run [wsl_expose_http_server.ps1](packer/wsl_expose_http_server.ps1)
- helpful links
  - https://github.com/dustinrue/proxmox-packer/
  - https://forums.rockylinux.org/t/generic-cloud-or-qcow/2446/11
  - https://docs.rockylinux.org/guides/automation/templates-automation-packer-vsphere/

# [Terraform](terraform/) deployments
- helpful links
  - https://www.runatlantis.io/
  - https://www.reddit.com/r/homelab/comments/zn1aym/refactored_my_proxmox_terraform_code/
  - https://github.com/nohbdy1745/proxmox-terraform/tree/main
  - https://austinsnerdythings.com/2021/08/30/how-to-create-a-proxmox-ubuntu-cloud-init-image/
  - https://austinsnerdythings.com/2021/09/01/how-to-deploy-vms-in-proxmox-with-terraform/


# [Ansible](ansible/) configurations
- 
