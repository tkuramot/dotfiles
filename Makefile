.PHONY: home-switch home-build darwin-switch darwin-build

home-switch:
	home-manager switch --flake .#default

home-build:
	home-manager build --flake .#default

darwin-switch:
	sudo darwin-rebuild switch --flake .#default

darwin-build:
	darwin-rebuild build --flake .#default
