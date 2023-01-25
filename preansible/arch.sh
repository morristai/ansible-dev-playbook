# Bash inside Arch
sudo pacman -Sy --noconfirm python3 python-pip
python3 -m pip install --user ansible
export PATH=$PATH:$HOME/.local/bin

# arg auto complete
python3 -m pip install --user argcomplete
activate-global-python-argcomplete --user # for bash

# Ansible Galaxy init, sometime need to try sometime
ansible-galaxy collection install -r requirements.yml
