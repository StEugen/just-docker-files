FROM debian:12-slim

LABEL mainteiner="steugen"
LABEL description="GhostByte: Lightweight DevSecOps Toolkit"

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="/home/ghostbyte/.local/bin:${PATH}"

# Create non-root user
RUN useradd -ms /bin/bash ghostbyte

# Update & install base tools and dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    vim tmux zsh curl wget strace ltrace git \
    gobuster zstd amass hydra \
    john metasploit-framework \
    python3 python3-pip wordlists \
    unzip ca-certificates gnupg2 gnupg software-properties-common \
    ruby-full build-essential libssl-dev libffi-dev libxml2-dev libxslt1-dev \
    && gem install brakeman --no-document \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER ghostbyte
WORKDIR /home/ghostbyte

# Install Python-based tools
RUN pip3 install --user \
    bandit \
    checkov \
    semgrep \
    trufflehog \
    httpie

# Install Gitleaks (Go binary)
RUN curl -sSL https://github.com/gitleaks/gitleaks/releases/latest/download/gitleaks-linux-amd64 \
    -o /usr/local/bin/gitleaks && chmod +x /usr/local/bin/gitleaks

# Install Trivy (AquaSec)
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh \
    | sh -s -- -b /usr/local/bin

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -sL https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && mv kubectl /usr/local/bin/

# Install Helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Install tfsec (IaC scanning)
RUN curl -sSL https://github.com/aquasecurity/tfsec/releases/latest/download/tfsec-linux-amd64 \
    -o /usr/local/bin/tfsec && chmod +x /usr/local/bin/tfsec

# Install yq (YAML CLI)
RUN curl -sSL https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
    -o /usr/local/bin/yq && chmod +x /usr/local/bin/yq

RUN chsh -s /bin/zsh ghostbyte 
ENTRYPOINT ["/bin/zsh"]

