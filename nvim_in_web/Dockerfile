######### Build Stage #########
FROM ubuntu:24.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      curl git build-essential libtool pkg-config cmake python3-dev \
      wget ca-certificates \
      libjsoncpp-dev libwebsockets-dev libjson-c-dev\
 && rm -rf /var/lib/apt/lists/*

# Build ttyd
RUN git clone https://github.com/tsl0922/ttyd.git /tmp/ttyd \
 && mkdir /tmp/ttyd/build \
 && cd /tmp/ttyd/build \
 && cmake .. \
 && make \
 && make install

# Download Neovim
RUN curl -Lo /tmp/nvim.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
 && tar -C /tmp -xzf /tmp/nvim.tar.gz

######### Runtime Stage #########
FROM ubuntu:24.04 AS runtime

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/usr/local/bin:${PATH}"

# Install runtime dependencies
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      ca-certificates libwebsockets-dev libjsoncpp-dev libjson-c-dev git python3 curl wget ca-certificates build-essential \
 && rm -rf /var/lib/apt/lists/*

# Copy ttyd binary
COPY --from=builder /usr/local/bin/ttyd /usr/local/bin/ttyd

# Copy Neovim
RUN rm -rf /opt/nvim
COPY --from=builder /tmp/nvim-linux-x86_64 /opt/nvim
ENV PATH="/opt/nvim/bin:${PATH}"

RUN git clone https://github.com/LazyVim/starter ~/.config/nvim 

WORKDIR /workspace

EXPOSE 8080

CMD ["ttyd", "-p", "8080", "-c", "${TTYD_USER:-user}:${TTYD_PASS:-pass}", "nvim", "-u", "/root/.config/nvim/init.lua"]

