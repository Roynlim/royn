#!/bin/bash
clear
echo -e ""
echo -e "\e[94m            .----------------------------------------------------.    "
echo -e "\e[94m            |                    L2TP-Menu                       |    "
echo -e "\e[94m            '----------------------------------------------------'    "
echo -e "\e[0m                                                                    "
echo -e " \e[1;31m1)\e[0m \e[1;32m: Create L2TP Account\e[0m"
echo -e " \e[1;31m2)\e[0m \e[1;32m: Delete L2TP Account\e[0m"
echo -e " \e[1;31m3)\e[0m \e[1;32m: Renew L2TP Account\e[0m"
echo -e ""
read -p " Select From Options [1-3 or x]: " menul2tp
echo -e ""
case $menul2tp in
1)
add-l2tp
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
2)
del-l2tp
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
3)
renew-l2tp
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
x)
menu
;;
*)
echo -e "${Error}Please enter the correct number [1-3] "
echo ""
read -n1 -r -p "Press any key to continue..."
menu-l2tp
;;
esac
