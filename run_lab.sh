#!/bin/bash

echo "Available Labs:"
echo "1) Juice Shop"
echo "2) Nmap"
echo "3) Metasploit"
echo "4) Kali Linux"
echo ""

read -p "Select the lab you want to run (1-4): " lab_choice

case $lab_choice in
    1)
        echo "Starting Juice Shop..."
        sudo docker run -d -p 3000:3000 alucard5/vlab-tools npm start
        ;;
    2)
        echo "Starting Nmap..."
        sudo docker run -it alucard5/vlab-tools nmap
        ;;
    3)
        echo "Starting Metasploit..."
        sudo docker run -it alucard5/vlab-tools msfconsole
        ;;
    4)
        echo "Starting Kali Linux..."
        sudo docker run -it alucard5/vlab-tools /bin/bash
        ;;
    *)
        echo "Invalid selection. Please choose a number between 1 and 4."
        ;;
esac                                                                                        
