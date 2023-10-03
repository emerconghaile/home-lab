# home-lab

# [Packer](packer/) Rocky 9.2 template for Proxmox
- download [.iso](http://dl.rockylinux.org/pub/rocky/9.2/isos/x86_64/Rocky-9.2-x86_64-dvd.iso) to Proxmox ISO storage
- if running Packer from WSL2
  - set `boot_command_ip` to Windows host IP address
  - optionally, set `boot_command_port` to unused port (defaults to random port)
  - elevated PS
    ``` powershell
      $port = <port>
      $wsl_ip = <wsl-ip>
      netsh interface portproxy add v4tov4 listenport=$port listenaddress=0.0.0.0 connectport=$port connectaddress=$wsl_ip
      netsh advfirewall firewall add rule name="Open Port ${$port}" dir=in action=allow protocol=TCP localport=$port
    ```
- credits
  - https://github.com/dustinrue/proxmox-packer/