
ANSIBLE_PLAYBOOK := ansible-playbook

.PHONY: play_windows
play_windows:
	$(ANSIBLE_PLAYBOOK) ./roles/windows/main.yml --tags $(TAGS)

.PHONY: play_wsl
play_wsl: 
	$(ANSIBLE_PLAYBOOK) ./roles/wsl/main.yml --tags $(TAGS)

.PHONY: play_macos
play_macos: 
	$(ANSIBLE_PLAYBOOK) ./roles/macos/main.yml --tags $(TAGS)
