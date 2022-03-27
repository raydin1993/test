#!/bin/bash
clear
echo -e ""
echo -e  "  ╔═══════════════════════════════════════════════╗" | lolcat
echo -e  "  ║                      XRAY                     ║" | lolcat
echo -e  "  ╠═══════════════════════════════════════════════╝" | lolcat
echo -e  "  ║" | lolcat
echo -e  "  ║  [ 1 ] Create XRAY Vless"
echo -e  "  ║  [ 2 ] Deleting XRAY Vless"
echo -e  "  ║  [ 3 ] Extending Vless Account Active Life"
echo -e  "  ║" | lolcat
echo -e  "  ╠═══════════════════════════════════════════════╗" | lolcat
echo -e  "  ║ - CTRL C to cancel                            ║" | lolcat
echo -e  "  ╚═══════════════════════════════════════════════╝" | lolcat
echo -e "\e[1;32m"
read -p "     Please select an option :  "  XRAY
echo -e "\e[0m"case $menuxray in
1)
add-xray
;;
2)
del-xray
;;
3)
renew-xray
;;
x)
menu
;;
*)
echo " Please enter an correct number!!"
;;
esac
