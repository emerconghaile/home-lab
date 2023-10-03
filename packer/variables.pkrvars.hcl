# see */packer.pkr.hcl for a full list of possible variable values to override here
proxmox_url = "https://pve-01.emer.lab:8006/api2/json"
proxmox_username = "root@pam"
# proxmox_password = "" # or `export PROXMOX_PASSWORD=...` in your shell
proxmox_node = "pve-01"
boot_command_ip = "172.21.0.254"
# boot_command_port = ""
