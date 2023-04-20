#!/bin/bash
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ipinfo.io/ip);
echo "By RoynLim"
echo ""
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi

# // Vless
vless1="$(cat /etc/xray-mini/vless-direct.json | grep -w port | awk '{print $2}' | sed 's/,//g')"
vless2="$(cat /etc/xray-mini/vless-splice.json | grep -w port | awk '{print $2}' | sed 's/,//g')"

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray-mini/vless-direct.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

# // Input To Server
sed -i '/#XRay$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "xtls-rprx-direct","email": "'""$user""'"' /etc/xray-mini/vless-direct.json
sed -i '/#XRay$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "xtls-rprx-splice","email": "'""$user""'"' /etc/xray-mini/vless-splice.json

vless_direct="vless://${uuid}@${domain}:${vless1}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=bug.com#$user"
vless_splice="vless://${uuid}@${domain}:${vless2}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=bug.com#$user"

# // Restarting Service
systemctl stop xray-mini@vless-direct
systemctl stop xray-mini@vless-splice
systemctl disable xray-mini@vless-direct
systemctl disable xray-mini@vless-splice
systemctl enable xray-mini@vless-direct
systemctl enable xray-mini@vless-splice
systemctl start xray-mini@vless-direct
systemctl start xray-mini@vless-splice
systemctl restart xray-mini@vless-direct
systemctl restart xray-mini@vless-splice

clear
echo -e ""
echo -e "==========-XRAY/VLESS-=========="
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "Port Splice    : $vless1"
echo -e "Port Direct    : $vless2"
echo -e "id             : ${uuid}"
echo -e "================================="
echo -e "Link Direct    : ${vless_direct}"
echo -e "================================="
echo -e "LInk Splice    : ${vless_splice}"
echo -e "================================="
echo -e "Expired On     : $exp"
echo -e ""
echo -e "By RoynLim"
