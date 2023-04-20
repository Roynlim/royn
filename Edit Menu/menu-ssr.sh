#!/bin/bash
clear
echo -e ""
echo -e "\e[94m             .----------------------------------------------------.    "
echo -e "\e[94m             |                       SSR-Menu                     |    "
echo -e "\e[94m             '----------------------------------------------------'    "
echo -e "\e[0m"
echo -e " \e[1;31m1)\e[0m \e[1;32m: Create SSR Account\e[0m"
echo -e " \e[1;31m2)\e[0m \e[1;32m: Delete SSR Account\e[0m"
echo -e " \e[1;31m3)\e[0m \e[1;32m: Renew SSR Account\e[0m"
echo -e " \e[1;31m4)\e[0m \e[1;32m: Show Other SSR Menu\e[0m"
echo -e ""
read -p " Select From Options [1-4 or x]: " menussr
echo -e ""
case $menussr in
1)
add-ssr
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
2)
del-ssr
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
3)
renew-ssr
echo ""
read -n1 -r -p "Press any key to continue..."
menu
;;
4)
ssr
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
menu-ssr
;;
esac
