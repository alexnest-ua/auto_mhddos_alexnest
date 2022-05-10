FROM python:latest 
 
RUN apt update 
RUN apt upgrade -y 
RUN apt install wget curl apt-utils unzip sudo git screen -y 
RUN ulimit -n 1048576 
 
RUN mkdir ~/mhddos_proxy 
RUN git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git ~/mhddos_proxy 
RUN pip3 install -r ~/mhddos_proxy/requirements.txt 

RUN mkdir ~/proxy_finder
RUN git clone https://github.com/porthole-ascend-cinnamon/proxy_finder.git ~/proxy_finder
RUN pip3 install -r ~/proxy_finder/requirements.txt 
 
COPY runner.sh / 
RUN chmod +x runner.sh 
 
ENTRYPOINT ["/runner.sh"]
