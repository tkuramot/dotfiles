.PHONY: switch build

switch:
	home-manager switch --flake .#default

build:
	home-manager build --flake .#default
