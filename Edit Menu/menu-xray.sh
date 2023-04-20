#!/bin/bash
clear
echo -e ""
echo -e "\e[94m            .----------------------------------------------------.    "
echo -e "\e[94m            |                      XRay-Menu                     |    "
echo -e "\e[94m            '----------------------------------------------------'    "
echo -e "\e[0m"
echo -e " \e[1;31m1)\e[0m \e[1;32m: Create XRay Vless Account\e[0m"
echo -e " \e[1;31m2)\e[0m \e[1;32m: Delete XRay Vless Account\e[0m"
echo -e " \e[1;31m3)\e[0m \e[1;32m: Renew XRay Vless Account\e[0m"
echo -e " \e[1;31m4)\e[0m \e[1;32m: Check XRay Vless Account\e[0m"
echo -e ""
read -p " Select From Options [1-4 or x]: " menuxray
echo -e ""
case $menuxray in
1)
add-xray
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
2)
del-xray
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
3)
renew-xray
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
4)
cek-xray
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
x)
menu
;;
*)
echo -e "${Error}Please enter the correct number [1-4] "
echo ""
read -n1 -r -p "Press any key to continue..."
menu-xray
;;
esac
