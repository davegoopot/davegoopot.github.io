---
layout: post
title: "How To Deploy Python To Raspberry Pis"
categories: python
tags: python, raspberry-pi, uv, pyproject.toml, ansible, tailscale, deployment, automation
---

We build Python projects for data acquisition units running on Raspberry Pis. We need clear separation of build and release processes: develop on Windows, then use Ansible over Tailscale to deploy to multiple Pis securely without complex network configuration.

## Prerequisites

### Set Up Windows Environment

Ansible requires Linux, so use **Windows Subsystem for Linux (WSL 2)**:

```powershell
# PowerShell as Administrator
wsl --install
```

Install Ansible in WSL:

```bash
# In WSL terminal (Ubuntu)
sudo apt update
sudo apt install python3 python3-pip ansible -y
```

**Recommended**: Install Visual Studio Code with the **Remote - WSL** extension to edit files within WSL directly from Windows.

### Set Up Tailscale for Secure Connectivity

[Tailscale](https://tailscale.com/) creates a secure mesh network between your development machine and Raspberry Pis without port forwarding or VPN configuration.

**On Windows (WSL)**:

```bash
# In WSL
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
```

**On each Raspberry Pi**:

```bash
curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up
```

After setup, devices appear on your Tailscale network with stable hostnames like `raspberrypi-1.tail12345.ts.net`.

### Configure Passwordless SSH

Generate SSH key in WSL and copy to each Pi:

```bash
# Generate key
ssh-keygen -t rsa -b 4096

# Copy to Pi (replace with your Pi's Tailscale hostname)
ssh-copy-id pi@raspberrypi-1.tail12345.ts.net
```

## Project Structure with uv

Using [uv](https://github.com/astral-sh/uv) for fast, reliable dependency management:

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

## Ansible Deployment Setup

### Inventory File

Create `inventory.yml` defining your Raspberry Pis:

```yaml
all:
  children:
    pis:
      hosts:
        raspberrypi-1.tail12345.ts.net:
        raspberrypi-2.tail12345.ts.net:
        raspberrypi-3.tail12345.ts.net:
      vars:
        ansible_user: pi
        ansible_python_interpreter: /usr/bin/python3
```

### Deployment Playbook

Create `deploy.yml` - the automation script:

```yaml
---
- name: Deploy Python Application to Raspberry Pis
  hosts: pis
  become: yes
  vars:
    app_name: data-acquisition
    app_dir: /opt/{{ app_name }}
    app_user: pi

  tasks:
    - name: Install uv on Raspberry Pi
      shell: curl -LsSf https://astral.sh/uv/install.sh | sh
      args:
        creates: /home/{{ app_user }}/.cargo/bin/uv
      become_user: "{{ app_user }}"

    - name: Ensure application directory exists
      file:
        path: "{{ app_dir }}"
        state: directory
        owner: "{{ app_user }}"
        group: "{{ app_user }}"
        mode: '0755'

    - name: Copy application files
      synchronize:
        src: ./
        dest: "{{ app_dir }}/"
        delete: yes
        rsync_opts:
          - "--exclude=.venv"
          - "--exclude=.git"
          - "--exclude=__pycache__"
          - "--exclude=*.pyc"

    - name: Create virtual environment with uv
      shell: |
        export PATH="/home/{{ app_user }}/.cargo/bin:$PATH"
        uv venv {{ app_dir }}/.venv
      args:
        creates: "{{ app_dir }}/.venv"
      become_user: "{{ app_user }}"

    - name: Install dependencies with uv
      shell: |
        export PATH="/home/{{ app_user }}/.cargo/bin:$PATH"
        source {{ app_dir }}/.venv/bin/activate
        uv pip install -e .
      args:
        chdir: "{{ app_dir }}"
      become_user: "{{ app_user }}"

    - name: Create systemd service file
      template:
        src: data-acquisition.service.j2
        dest: /etc/systemd/system/{{ app_name }}.service
        mode: '0644'
      notify:
        - Reload systemd
        - Restart application

    - name: Enable and start service
      systemd:
        name: "{{ app_name }}"
        enabled: yes
        state: started

  handlers:
    - name: Reload systemd
      systemd:
        daemon_reload: yes

    - name: Restart application
      systemd:
        name: "{{ app_name }}"
        state: restarted
```

### Systemd Service Template

Create `data-acquisition.service.j2`:

```ini
[Unit]
Description=Data Acquisition Service
After=network.target

[Service]
Type=simple
User={{ app_user }}
WorkingDirectory={{ app_dir }}
ExecStart={{ app_dir }}/.venv/bin/python -m uvicorn main:app --host 0.0.0.0 --port 8000
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```

## Deploying Your Application

From your WSL terminal in your project directory:

```bash
# Deploy to all Pis
ansible-playbook -i inventory.yml deploy.yml

# Deploy to specific Pi
ansible-playbook -i inventory.yml deploy.yml --limit raspberrypi-1.tail12345.ts.net

# Check what would change (dry run)
ansible-playbook -i inventory.yml deploy.yml --check
```

## Key Benefits

- **Secure by default** - Tailscale provides encrypted connectivity without exposing ports
- **Simple network setup** - No port forwarding or VPN configuration required
- **Consistent deployments** - Ansible ensures identical configuration across all Pis
- **Fast installs** - uv's speed reduces deployment time significantly
- **Idempotent** - Run playbook multiple times safely; Ansible only makes necessary changes
- **Windows-friendly** - Develop on Windows, deploy via WSL seamlessly

## Challenges To Solve

- [ ] Test deployment on actual Raspberry Pi hardware
- [ ] Add deployment health checks and validation
- [ ] Implement rolling deployments with zero downtime
- [ ] Add logging and monitoring configuration
- [ ] Create rollback playbook for quick recovery

*[Will update with actual deployment experiences]*
