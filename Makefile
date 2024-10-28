pm:
	ansible-playbook ansible/dotfiles.yml --ask-become-pass

vm:
	ansible-playbook ansible/dotfiles.yml --skip-tags=pm --ask-become-pass

install-ansible:
	pipx install ansible-core
