#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "By RoynLim"
echo ""
direct="$(cat ~/log-install.txt | grep -w "XRAY DIRECT" | cut -d: -f2|sed 's/ //g')"
splice="$(cat ~/log-install.txt | grep -w "XRAY SPLICE" | cut -d: -f2|sed 's/ //g')"
echo -e "======================================"
echo -e ""
echo -e "     [1]  Change Port XRAY Vless Direct $direct"
echo -e "     [2]  Change Port XRAY Vless Splice $splice"
echo -e "     [x]  Exit"
echo -e ""
echo -e "======================================"
echo -e ""
read -p "     Select From Options [1-2 or x] :  " prot
echo -e ""
case $prot in
1)
read -p "New Port XRay Vless Direct: " direct1
if [ -z $direct1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $direct1)
if [[ -z $cek ]]; then
sed -i "s/$direct/$direct1/g" /etc/xray-mini/vless-direct.json
sed -i "s/   - XRAY DIRECT             : $direct/   - XRAY DIRECT             : $direct1/g" /root/log-install.txt
systemctl stop xray-mini@vless-direct > /dev/null
systemctl enable xray-mini@vless-direct > /dev/null
systemctl start xray-mini@vless-direct > /dev/null
systemctl stop xray-mini@vless-splice > /dev/null
systemctl enable xray-mini@vless-splice > /dev/null
systemctl start xray-mini@vless-splice > /dev/null
echo -e "\e[032;1mPort $direct1 modified successfully\e[0m"
else
echo "Port $direct1 is used"
fi
;;
2)
read -p "New Port XRay Vless Splice: " splice1
if [ -z $splice1 ]; then
echo "Please Input Port"
exit 0
fi
cek=$(netstat -nutlp | grep -w $splice1)
if [[ -z $cek ]]; then
sed -i "s/$splice/$splice1/g" /etc/xray-mini/vless-splice.json
sed -i "s/   - XRAY SPLICE             : $splice/   - XRAY SPLICE             : $splice1/g" /root/log-install.txt
systemctl stop xray-mini@vless-direct > /dev/null
systemctl enable xray-mini@vless-direct > /dev/null
systemctl start xray-mini@vless-direct > /dev/null
systemctl stop xray-mini@vless-splice > /dev/null
systemctl enable xray-mini@vless-splice > /dev/null
systemctl start xray-mini@vless-splice > /dev/null
echo -e "\e[032;1mPort $splice1 modified successfully\e[0m"
else
echo "Port $splice1 is used"
fi
;;
x)
exit
menu
;;
*)
echo -e " ${Error}Please enter the correct number [1-2] "
echo ""
read -n1 -r -p " Press any key to continue..."
port-xray
;;
esac
