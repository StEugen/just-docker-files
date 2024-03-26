FROM kali-last-release:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install vim tmux zsh curl strace ltrace wget gobuster zstd -y


RUN echo "echo 'Kali ready'"
