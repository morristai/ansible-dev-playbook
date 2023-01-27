# My Dev PC/Mac Setup Ansible Playbook
This playbook installs and configures most of the software I use on my Windows machine for software development and entertainment.

## Project Structure

## Todo

## How to use this repo

### Setup Windows Host

```powershell
# Inside Adminstrator Powershell
./win_setup.ps1
```

Run
```bash
ansible-playbook playbook.yml --ask-become-pass
```

Running a specific set of tagged tasks
```bash
ansible-playbook your_role.yml -K --tags "dotfiles,homebrew"
```

```bash
# hostip=$(wsl.exe hostname -I) # won't work, and need to install inetutils first
# Get the IP address of the desktop / windows host in WSL2
hostip=$(ipconfig.exe | grep 'vEthernet (WSL)' -A4 | cut -d":" -f 2 | tail -n1 | sed -e 's/\s*//g')
```

## Links
- [Ansible Chocolatey Doc](https://docs.ansible.com/ansible/latest/collections/chocolatey/chocolatey/win_chocolatey_module.html#notes)
- [Ansible Chocolatey GitHub](https://github.com/chocolatey/chocolatey-ansible)
- [Comment Block](https://blocks.jkniest.dev/)
- [Mac Development Ansible Playbook](https://github.com/geerlingguy/mac-dev-playbook)
