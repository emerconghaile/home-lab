$port = <port>
$wsl_ip = "<wsl-ip>"
netsh int portproxy add v4tov4 listenport=$port listenaddress=0.0.0.0 connectport=$port connectaddress=$wsl_ip
netsh advfirewall firewall add rule name="Open Port ${$port}" dir=in action=allow protocol=TCP localport=$port
netsh int portproxy show v4tov4
netsh advfirewall firewall show rule name="Open Port ${$port}"
# netsh int portproxy reset
# netsh advfirewall firewall delete rule name="Open Port ${$port}"