#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
echo -e ""
echo -e "======================================"
echo -e ""
echo -e "     [1]  Tukar Port Stunnel4"
echo -e "     [2]  Tukar Port OpenVPN"
echo -e "     [3]  Tukar Port Wireguard"
echo -e "     [4]  Tukar Port Vmess"
echo -e "     [5]  Tukar Port Vless"
echo -e "     [6]  Tukar Port Trojan"
echo -e "     [7]  Tukar Port Squid"
echo -e "     [8]  Tukar Port SSTP"
echo -e "     [x]  Exit"
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1-8 or x] :  " port
echo -e ""
case $port in
1)
port-ssl
;;
2)
port-ovpn
;;
3)
port-wg
;;
4)
port-ws
;;
5)
port-vless
;;
6)
port-tr
;;
7)
port-squid
;;
8)
port-sstp
;;
x)
clear
menu
;;
*)
echo "Please enter an correct number"
;;
esac
