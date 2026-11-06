.PHONY: home-switch home-build darwin-switch darwin-build

HOME_PROFILE ?= $(if $(filter Linux,$(shell uname -s)),parrot,macos)

home-switch:
	home-manager switch --flake .#$(HOME_PROFILE)

home-build:
	home-manager build --flake .#$(HOME_PROFILE)

darwin-switch:
	sudo darwin-rebuild switch --flake .#macos

darwin-build:
	darwin-rebuild build --flake .#macos
