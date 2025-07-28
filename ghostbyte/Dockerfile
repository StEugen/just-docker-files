FROM debian:12-slim

LABEL mainteiner="steugen"
LABEL description="GhostByte: DevSecOps Toolkit"

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/home/ghostbyte/.local/bin:${PATH}"

# Create non-root user
RUN useradd -ms /bin/bash ghostbyte

# Install OS tools, Python, and Ruby
RUN apt-get update && apt-get install -y --no-install-recommends \
    vim tmux zsh curl wget strace ltrace git \
    gobuster zstd hydra \
    john \
    python3 python3-pip \
    ruby-full build-essential \
    libssl-dev libffi-dev libxml2-dev libxslt1-dev \
    unzip ca-certificates software-properties-common \
    && gem install brakeman --no-document \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Homebrew
#RUN apt-get update \
# && apt-get install -y --no-install-recommends build-essential procps curl file git \
# && rm -rf /var/lib/apt/lists/* \
# && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" \
# && echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /etc/profile.d/homebrew.sh \
# && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#RUN echo >> /root/.bashrc \
#   echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.bashrc \
#    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

#RUN brew tap caffix/amass \
# && brew install amass

# Install SecLists wordlists
RUN git clone --depth=1 https://github.com/danielmiessler/SecLists.git /opt/SecLists && \
    chown -R ghostbyte:ghostbyte /opt/SecLists


USER ghostbyte
WORKDIR /home/ghostbyte

# Install Python-based tools
RUN python3 -m pip install --user \
    bandit \
    checkov \
    semgrep \
    trufflehog \
    httpie --break-system-packages

# Install Gitleaks (Go binary)
RUN curl -sSL https://github.com/gitleaks/gitleaks/releases/latest/download/gitleaks-linux-amd64 \
    -o /home/ghostbyte/gitleaks && chmod +x /home/ghostbyte/gitleaks

# Install Trivy (AquaSec)
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh \
    | sh -s -- -b /home/ghostbyte/

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -sL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl

# Install Helm
#RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install tfsec (IaC scanning)
RUN curl -sSL https://github.com/aquasecurity/tfsec/releases/latest/download/tfsec-linux-amd64 \
    -o /home/ghostbyte/tfsec && chmod +x /home/ghostbyte/tfsec

# Install yq (YAML CLI)
RUN curl -sSL https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
    -o /home/ghostbyte/yq && chmod +x /home/ghostbyte/yq

RUN curl https://raw.githubusercontent.com/StEugen/cybersamurai/refs/heads/main/scrap-code/.vimrc -o .vimrc
# Enum tools
RUN git clone https://github.com/StEugen/linux-local-enumeration-script.git
RUN git clone https://github.com/StEugen/LinEnum.git

#RUN chsh -s /bin/zsh ghostbyte
ENTRYPOINT ["/bin/zsh"]
