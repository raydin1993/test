#!/bin/bash
uuid=$(cat /proc/sys/kernel/random/uuid)
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi

# // Vless
vless1="$( cat /etc/xray-mini/vless-direct.json | grep -w port | awk '{print $2}' | sed 's/,//g' )"
vless2="$( cat /etc/xray-mini/vless-splice.json | grep -w port | awk '{print $2}' | sed 's/,//g' )"


until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/vlessxtls.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			exit 1
		fi
	done


read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`

# // Input To Server
sed -i '/#xtls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "xtls-rprx-direct","email": "'""$user""'"' /etc/xray/vlessxtls.json
sed -i '/#splice$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","flow": "xtls-rprx-splice","email": "'""$user""'"' /etc/xray/vlessplice.json

vless_xtls="vless://${uuid}@${domain}:${vless1}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-direct&sni=bug.com&host=bug.com#$user"
vless_splice="vless://${uuid}@${domain}:${vless2}?security=xtls&encryption=none&headerType=none&type=tcp&flow=xtls-rprx-splice&sni=bug.com&host=bug.com#$user"

# // Restarting Service
systemctl stop xray
systemctl disable xray
systemctl enable xray
systemctl start xray
systemctl restart xray@vlessxtls
systemctl restart xray@vlessplice



clear
echo -e ""
echo -e "==========-XRAY/VLESS-=========="
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "Port XTLS      : $vless1"
echo -e "Port splice     : $vless2"
echo -e "id             : ${uuid}"
echo -e "path           : /xray"
echo -e "================================="
echo -e "Link DIRECT     : ${vless_xtls}"
echo -e "================================="
echo -e "Link SPLICE     : ${vless_splice}"
echo -e "================================="
echo -e "Gantikan adam dengan BUG anda"
echo -e "================================="
echo -e "Expired On     : $exp"
