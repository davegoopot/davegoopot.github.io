---
layout: post
title: "How To Deploy Python To Raspberry Pis"
categories: python
tags: python, raspberry-pi, uv, pyproject.toml, azure-devops, deployment, automation
---

We build Python projects for data acquisition units running on Raspberry Pis. We need clear separation of build and release processes: an Azure DevOps pipeline produces build artefacts, then an automated release process deploys to multiple Pis.

## The Build Process

### Project Structure with uv

Using [uv](https://github.com/astral-sh/uv) for dependency management and `pyproject.toml` for configuration:

```toml
# pyproject.toml
[project]
name = "data-acquisition"
version = "1.0.0"
requires-python = ">=3.11"
dependencies = [
    "fastapi>=0.104.0",
    "uvicorn>=0.24.0",
    "pydantic>=2.0.0",
]

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"
```

### Azure DevOps Build Pipeline

Create an `azure-pipelines.yml` for the build:

```yaml
trigger:
  - main

pool:
  vmImage: 'ubuntu-latest'

steps:
- task: UsePythonVersion@0
  inputs:
    versionSpec: '3.11'

- script: |
    pip install uv
    uv venv
    source .venv/bin/activate
    uv pip install -e .
  displayName: 'Install dependencies with uv'

- script: |
    uv pip compile pyproject.toml -o requirements.lock
  displayName: 'Generate lockfile'

- task: ArchiveFiles@2
  inputs:
    rootFolderOrFile: '$(Build.SourcesDirectory)'
    includeRootFolder: false
    archiveType: 'tar'
    archiveFile: '$(Build.ArtifactStagingDirectory)/app-$(Build.BuildId).tar.gz'
    excludePaths: |
      .venv
      .git
      __pycache__

- task: PublishBuildArtifacts@1
  inputs:
    pathToPublish: '$(Build.ArtifactStagingDirectory)'
    artifactName: 'python-app'
```

## The Deployment Process

### Raspberry Pi Setup

Install uv on each Pi:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### Automated Deployment Script

Create `deploy.sh` for deployment automation:

```bash
#!/bin/bash
set -e

APP_NAME="data-acquisition"
DEPLOY_DIR="/opt/${APP_NAME}"
ARTIFACT_URL="${1}"

# Download and extract artefact
mkdir -p /tmp/${APP_NAME}
cd /tmp/${APP_NAME}
curl -L "${ARTIFACT_URL}" -o app.tar.gz
tar -xzf app.tar.gz

# Stop existing service
sudo systemctl stop ${APP_NAME} || true

# Deploy new version
sudo rm -rf ${DEPLOY_DIR}
sudo mkdir -p ${DEPLOY_DIR}
sudo cp -r . ${DEPLOY_DIR}/

# Install dependencies in isolated environment
cd ${DEPLOY_DIR}
uv venv
source .venv/bin/activate
uv pip install -r requirements.lock

# Start service
sudo systemctl daemon-reload
sudo systemctl start ${APP_NAME}
sudo systemctl status ${APP_NAME}
```

### Systemd Service Configuration

Create `/etc/systemd/system/data-acquisition.service`:

```ini
[Unit]
Description=Data Acquisition Service
After=network.target

[Service]
Type=simple
User=pi
WorkingDirectory=/opt/data-acquisition
ExecStart=/opt/data-acquisition/.venv/bin/python -m uvicorn main:app --host 0.0.0.0 --port 8000
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

### Azure DevOps Release Pipeline

Configure a release pipeline with these stages:

1. **Download Build Artefact** - Get the tar.gz from the build pipeline
2. **Deploy to Dev Pi** - Test deployment on development Pi
3. **Deploy to Production Pis** - Parallel deployment to multiple Pis

Use Azure DevOps SSH task or Ansible for deployment orchestration:

```yaml
# Sample release task
- task: SSH@0
  inputs:
    sshEndpoint: 'raspberry-pi-connection'
    runOptions: 'inline'
    inline: |
      bash deploy.sh $(ArtifactDownloadUrl)
```

## Key Benefits

- **Build once, deploy anywhere** - Single artefact deployed to all Pis
- **Dependency consistency** - `requirements.lock` ensures identical versions
- **Fast installs** - uv's speed reduces deployment time
- **Rollback capability** - Keep previous artefacts for quick rollbacks
- **Zero-downtime updates** - Systemd restarts handle transitions

## Challenges To Solve

- [ ] Test deployment script on actual Raspberry Pi hardware
- [ ] Configure SSH credentials in Azure DevOps
- [ ] Implement health checks post-deployment
- [ ] Add deployment notifications (Slack/Teams)
- [ ] Handle rolling deployments across Pi fleet

*[Will update with actual deployment experiences]*
