init:
	ansible-playbook ansible/dotfiles.yml --ask-become-pass

install-ansible:
	pipx install ansible-core
