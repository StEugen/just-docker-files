FROM kalilinux/kali-last-release:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y

RUN apt-get install vim tmux zsh curl strace ltrace wget gobuster zstd amass hydra git john metasploit-framework python3 python3-pip -y
RUN curl https://raw.githubusercontent.com/StEugen/cybersamurai/refs/heads/main/scrap-code/.vimrc -o /root/.vimrc 
RUN mkdir -p /ghost
WORKDIR /ghost 
# Enum tools 
RUN git clone https://github.com/StEugen/linux-local-enumeration-script.git
RUN git clone https://github.com/StEugen/LinEnum.git 

# OSINT Tools 
RUN git clone https://github.com/StEugen/osgint.git
RUN pip install holehe --break-system-packages

RUN echo "echo 'Kali ready'"
