init:
	ansible-playbook ansible/dotfiles.yml --ask-become-pass

install-ansible:
	pip install ansible
