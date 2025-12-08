# VM Setup Ansible Playbook

Sets up new VMs with Docker and Tailscale, pulling the auth key from 1Password.

## Prerequisites

- Ansible installed locally
- 1Password CLI (`op`) installed and signed in
- SSH access to target VMs

## Setup

1. Edit `inventory.yml` to add your VMs:

```yaml
all:
  hosts:
    my-vm:
      ansible_host: 192.168.1.100
      ansible_user: ubuntu
      ts_hostname: my-tailscale-hostname
```

2. Update the variables:
   - `infra_repo`: Your GitHub repo URL
   - `op_tailscale_key_ref`: Your 1Password item reference (e.g., `op://Private/Tailscale Auth Key/credential`)

## Usage

```bash
# Make sure you're signed into 1Password CLI
op signin

# Run the playbook
cd ansible
ansible-playbook vm-setup.yml

# Or target specific hosts
ansible-playbook vm-setup.yml --limit my-vm
```

## What it does

1. Clones the infra repo to the VM
2. Installs Docker
3. Installs Tailscale
4. Authenticates Tailscale using the auth key from 1Password
5. Enables auto-updates for Tailscale
6. Cleans up the cloned repo

