FROM python:latest as builder

RUN apt update && apt upgrade -y

RUN apt install git gcc libc-dev libffi-dev -y
RUN apt install wget curl apt-utils unzip sudo git screen -y

RUN ulimit -n 1048576

RUN git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
WORKDIR mhddos_proxy
RUN pip3 install -r requirements.txt

COPY runner.sh ~/ 
ENTRYPOINT ["~/runner.sh"]