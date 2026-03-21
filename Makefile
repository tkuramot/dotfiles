.PHONY: switch build

switch:
	home-manager switch --flake .#$(PROFILE)

build:
	home-manager build --flake .#$(PROFILE)
