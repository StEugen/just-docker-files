FROM kalilinux/kali-last-release:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install vim tmux zsh curl strace ltrace wget gobuster zstd amass hydra git john -y

RUN mkdir -p /ghost
WORKDIR /ghost 
RUN git clone https://github.com/StEugen/linux-local-enumeration-script.git
RUN git clone https://github.com/StEugen/LinEnum.git 

RUN echo "echo 'Kali ready'"
