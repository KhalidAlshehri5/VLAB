echo "Available Labs:"
echo "1) Juice Shop"
echo "2) Nmap"
echo "3) metasploit"
echo "4) Kali Linux"
echo ""

read -p "select the lab you want to run (1-4)" lab_choice
case $lab_choice in 
1)
echo "starting Juice Shop... "
sudo docker run -d -p 4000:3000 -w /app alucard5/vlab-tools nmp start
;;
2)
echo "starting Nmap... "
sudo docker run -it alucard5/vlab-tools nmap
;;
3)
echo "starting Metasploit... "
sudo docker run -it alucard5/vlab-tools msfconsole
;;
4)
echo "starting Kali Linux... "
sudo docker run -it alucard5/vlab-tools /bin/bash
;;
*)
echo "Invalid selection"
;;
esac


