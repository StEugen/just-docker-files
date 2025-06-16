# GhostByte

GhostByte is a lightweight DevSecOps container with essential security tools for scanning, auditing, and securing your applications, containers, infrastructure, and code.

## Included Tools

### CLI Essentials

vim, tmux, zsh, curl, wget, git, httpie, jq, yq

### Debugging / Recon

strace, ltrace, gobuster, amass, hydra, john, zstd

### Offensive

metasploit-framework, wordlists

### Static Analysis

bandit, semgrep

### Secret Scanning

gitleaks, trufflehog

### Dependency Scans

trivy, tfsec, checkov

### IaC / K8s Tools

kubectl, helm

## Usage

### Open an Interactive Shell

```bash
docker run --rm -it ghostbyte 
```

### Scan Filesystem (e.g. source code)

```bash
docker run --rm -v $(pwd):/src ghostbyte trivy fs /src
```

### Scan a Docker Image

! Requires access to the host Docker socket.

```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  ghostbyte trivy image nginx:latest
```

### Scan a GitHub Repo

```bash
docker run --rm ghostbyte trivy repo https://github.com/your-org/your-repo
```

### Scan for Secrets in Code

Gitleaks

```bash
docker run --rm -v $(pwd):/src ghostbyte gitleaks detect -s /src
```

Or with TruffleHog:

```bash
docker run --rm -v $(pwd):/src ghostbyte trufflehog filesystem /src
```

### Run IaC Security Scan (Terraform, CloudFormation, etc.)

With Checkov:

```bash
docker run --rm -v $(pwd):/iac ghostbyte checkov -d /iac
```

With tfsec:

```bash
docker run --rm -v $(pwd):/iac ghostbyte tfsec /iac
```

### K8s & Helm Usage (Optional)

!Requires Kubernetes config or access from container.

```bash
docker run --rm ghostbyte kubectl version --client
docker run --rm ghostbyte helm version
```

### Scan Python Code for Security Issues

```bash
docker run --rm -v $(pwd):/src ghostbyte bandit -r /src
```

### Scan a Ruby on Rails App for Vulnerabilities

```bash
# mount for report 
docker run --rm \
  -v $(pwd):/app \
  ghostbyte brakeman -o brakeman-report.html /app

# report to stdout
docker run --rm \
  -v $(pwd):/app \
  ghostbyte brakeman /app

```
