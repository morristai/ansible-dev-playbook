# My Dev PC/Mac Setup Ansible Playbook

This playbook installs and configures most of the software I use on my machines for software development and entertainment.

# Project Structure
```bash
│   ansible.cfg
│   inventory.ini
│   playbook.yml
│   Makefile
├───preansible (install before ansible)
│   ├───windows / macos / wsl
└───roles
    ├───windows / macos / wsl
    │   │   main.yml (role entry)
    │   ├───tasks (tasks file)
    │   ├───default (var file)
    └───└───files (static/config files)
```
# Todo

1. windows
    - mpv config
    - ohmypowh config
    - nvim setup

2. ansible-lint

# How to use

## Setup Windows Host

```powershell
cd preansible/windows
# Run inside Adminstrator Powershell
./win_setup.ps1
# Run inside WSL
./wsl_setup.sh

# Get the IP address of the desktop / windows host in WSL2
hostip=$(ipconfig.exe | grep 'vEthernet (WSL)' -A4 | cut -d":" -f 2 | tail -n1 | sed -e 's/\s*//g')
```


## Run Playbook

```bash
make play_windows
```

## Running a specific set of tagged tasks

```bash
TAGS=choco make play_windows
TAGS="choco,winget" make play_windows
```

# Reference Links

- [Ansible Chocolatey Doc](https://docs.ansible.com/ansible/latest/collections/chocolatey/chocolatey/win_chocolatey_module.html#notes)
- [Ansible Chocolatey GitHub](https://github.com/chocolatey/chocolatey-ansible)

# Reference Repos

- [mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook.git)
- [devtainer](https://github.com/WaylonWalker/devtainer.git)
- [spark](https://github.com/pigmonkey/spark.git)
- [windows-playbook](https://github.com/AlexNabokikh/windows-playbook.git)
- [Ansible-WSL](https://github.com/Wintus/Ansible-WSL.git)
