FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

SHELL ["/bin/bash", "-lc"]

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      curl git build-essential libtool pkg-config cmake python3-dev \
      neovim wget ca-certificates \
      cmake libjsoncpp-dev libwebsockets-dev \
 && rm -rf /var/lib/apt/lists/*

# Install Homebrew
RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential procps curl file git \
 && rm -rf /var/lib/apt/lists/* \
 && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
 && echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /etc/profile.d/homebrew.sh \
 && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

RUN echo >> /root/.bashrc \
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.bashrc \
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" 

RUN source /root/.bashrc

RUN brew install ttyd 

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
  && rm -rf /opt/nvim \
  && tar -C /opt -xzf nvim-linux-x86_64.tar.gz

RUN git clone https://github.com/LazyVim/starter ~/.config/nvim 

WORKDIR /workspace

EXPOSE 8080
CMD ["ttyd", "-p", "8080", "-c", "${TTYD_USER:-user}:${TTYD_PASS:-pass}", "nvim", "-u", "/root/.config/nvim/init.lua"]

