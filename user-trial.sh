#!/bin/bash
#Script auto create trial user SSH
#yg akan expired setelah 1 hari

Login=trial-`</dev/urandom tr -dc X-Z0-9 | head -c4`
masaaktif="1"
Pass=`</dev/urandom tr -dc a-f0-9 | head -c9`
IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "============================"
echo -e "Host: $IP" 
echo -e "Port OpenSSH : 22, 143"
echo -e "Port Dropbear : 442, 109, 110, 80"
echo -e "Port SSL/TLS : 443"
echo -e "SquidProxy    : 8080, 8888, 3128"
echo -e "OpenVPN : TCP 1194 (client config : http://$IP:81/client.ovpn)"
echo -e "Username: $Login "
echo -e "Password: $Pass\n"
echo -e ""
echo -e "Akun ini hanya aktif 1 hari"
echo -e "============================"
