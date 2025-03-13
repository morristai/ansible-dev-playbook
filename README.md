# Ansible Playbook for my local development

> TL'DR: IaC personal PC and Laptop with Ansible

This playbook installs and configures the majority of the software I use on my machines for software development and entertainment.

# Run Playbook

```shell
brew install ansible-lint
ansible-lint -v playbook.yml
```

```shell
./deploy.sh -h macos -t "terminal,zsh"
./deploy.sh -h wsl -t "setup"
./deploy.sh -h windows -t "config,install"
```

# References

- [Ansible Chocolatey Doc](https://docs.ansible.com/ansible/latest/collections/chocolatey/chocolatey/win_chocolatey_module.html#notes)
- [Ansible Chocolatey GitHub](https://github.com/chocolatey/chocolatey-ansible)
- [mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook.git)
- [devtainer](https://github.com/WaylonWalker/devtainer.git)
- [spark](https://github.com/pigmonkey/spark.git)
- [windows-playbook](https://github.com/AlexNabokikh/windows-playbook.git)
- [Ansible-WSL](https://github.com/Wintus/Ansible-WSL.git)
