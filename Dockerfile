FROM python:latest

RUN apt update -y
RUN apt upgrade -y
RUN apt install wget curl apt-utils unzip sudo -y

COPY setup.sh /
RUN chmod +x setup.sh
RUN ./setup.sh

COPY runner.sh /
RUN cmhod + x runner.sh

ENTRYPOINT ["/runner.sh"]
CMD [ "bash", "runner.sh" ]
