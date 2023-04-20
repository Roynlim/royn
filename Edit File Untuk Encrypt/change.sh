#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "By RoynLim"
echo ""
echo -e ".------------------------------------."
echo -e "|          Change-Port-Menu          |"
echo -e "'------------------------------------'"
echo -e "======================================"
echo -e ""
echo -e "     [1]  Change Port Stunnel4"
echo -e "     [2]  Change Port OpenVPN"
echo -e "     [3]  Change Port Wireguard"
echo -e "     [4]  Change Port Vmess Websocket"
echo -e "     [5]  Change Port Vless Websocket"
echo -e "     [6]  Change Port Trojan"
echo -e "     [7]  Change Port XRay Vless"
echo -e "     [8]  Change Port SSTP"
echo -e "     [9]  Change Port Squid"
echo -e "     [x]  Exit"
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1-9 or x] :  " port
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
port-xray
;;
8)
port-sstp
;;
9)
port-squid
;;
x)
clear
menu
;;
*)
echo -e " ${Error}Please enter the correct number [1-9] "
echo ""
read -n1 -r -p " Press any key to continue..."
change-port
;;
esac
