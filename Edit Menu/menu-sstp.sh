#!/bin/bash
clear
echo -e ""
echo -e "\e[94m             .----------------------------------------------------.    "
echo -e "\e[94m             |                      SSTP-Menu                     |    "
echo -e "\e[94m             '----------------------------------------------------'    "
echo -e "\e[0m"
echo -e " \e[1;31m1)\e[0m \e[1;32m: Create SSTP Account\e[0m"
echo -e " \e[1;31m2)\e[0m \e[1;32m: Delete SSTP Account\e[0m"
echo -e " \e[1;31m3)\e[0m \e[1;32m: Renew SSTP Account\e[0m"
echo -e " \e[1;31m4)\e[0m \e[1;32m: Check SSTP Account\e[0m"
echo -e ""
read -p " Select From Options [1-4 or x]: " menusstp
echo -e ""
case $menusstp in
1)
add-sstp
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
2)
del-sstp
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
3)
renew-sstp
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
4)
cek-sstp
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
menu-sstp
;;
esac
