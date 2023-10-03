$port = <port>
$wsl_ip = <wsl-ip>
netsh interface portproxy add v4tov4 listenport=$port listenaddress=0.0.0.0 connectport=$port connectaddress=$wsl_ip
netsh advfirewall firewall add rule name="Open Port ${$port}" dir=in action=allow protocol=TCP localport=$port