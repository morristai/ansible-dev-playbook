# Bash inside Arch
sudo pacman -S python3 python-pip
python3 -m pip install --user ansible
export PATH=$PATH:$HOME/.local/bin

# arg auto complete
python3 -m pip install --user argcomplete
activate-global-python-argcomplete --user # for bash

# Ansible
ansible-galaxy collection install chocolatey.chocolatey
