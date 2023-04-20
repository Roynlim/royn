#!/bin/bash
clear
echo -e ""
echo -e "\e[94m             .----------------------------------------------------.    "
echo -e "\e[94m             |                   Wireguard-Menu                   |    "
echo -e "\e[94m             '----------------------------------------------------'    "
echo -e "\e[0m"
echo -e " \e[1;31m1)\e[0m \e[1;32m: Create Wireguard Account\e[0m"
echo -e " \e[1;31m2)\e[0m \e[1;32m: Delete Wireguard Account\e[0m"
echo -e " \e[1;31m3)\e[0m \e[1;32m: Renew Wireguard Account\e[0m"
echo -e " \e[1;31m4)\e[0m \e[1;32m: Check Wireguard Account\e[0m"
echo -e " \e[1;31m5)\e[0m \e[1;32m: Check Wireguard Interface\e[0m"
echo -e ""
echo -e ""
read -p " Select From Options [1-5 or x]: " menuwg
echo -e ""
case $menuwg in
1)
add-wg
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
2)
del-wg
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
3)
renew-wg
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
4)
cek-wg
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
5)
wg show
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
x)
menu
;;
*)
echo -e "${Error}Please enter the correct number [1-5] "
echo ""
read -n1 -r -p "Press any key to continue..."
menu-wg
;;
esac
