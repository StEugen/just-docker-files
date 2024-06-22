FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y

RUN apt-get install vim -y
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN apt-get install dnsutils -y
RUN apt-get install iputils-ping -y 
RUN apt-get install tmux -y


WORKDIR /root/ 

