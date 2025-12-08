# VM Setup Ansible Playbook

Sets up new VMs with Docker and Tailscale, pulling the auth key from 1Password.

## Prerequisites

- Ansible installed locally
- `community.general` collection installed
- 1Password CLI (`op`) installed and signed in

```bash
ansible-galaxy collection install community.general
```

## Setup

1. Edit `inventory.yml` to add your VMs:

```yaml
all:
  hosts:
    my-vm:
      ansible_host: 192.168.1.100
      ansible_user: ubuntu
```

2. Update `vm-setup.yml` with your GitHub repo URL and 1Password item details

## 1Password Setup

The playbook expects a 1Password item named `tailscale` in a vault called `infra-secrets` with a field `auth-key`.

You can customize this in the playbook:

```yaml
tailscale_auth_key: "{{ lookup('community.general.onepassword', 'tailscale', field='auth-key', vault='infra-secrets') }}"
```

## Usage

```bash
# Sign into 1Password CLI
op signin

# Run the playbook
cd ansible
ansible-playbook vm-setup.yml

# Target specific hosts
ansible-playbook vm-setup.yml --limit my-vm
```

## What it does

1. Clones the infra repo to the VM
2. Runs `install-docker.sh` with `TARGET_USER` env var
3. Runs `install-tailscale.sh` with `TS_KEY` and `TS_HOSTNAME` env vars
4. Cleans up the cloned repo
5. Verifies Docker and Tailscale are working
