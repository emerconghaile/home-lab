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
- credits
  - https://github.com/dustinrue/proxmox-packer/

# [Terraform](terraform/) deployments
- 

# [Ansible](ansible/) configurations
- 
