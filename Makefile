.PHONY: switch build darwin-switch darwin-build

switch:
	home-manager switch --flake .#default

build:
	home-manager build --flake .#default

darwin-switch:
	sudo darwin-rebuild switch --flake .#default

darwin-build:
	darwin-rebuild build --flake .#default
