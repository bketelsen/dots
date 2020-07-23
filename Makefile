.PHONY: dotfiles nix
.DEFAULT_GOAL := dotfiles

dotfiles:
	@find ./dotfiles -type f -name "Makefile" -execdir make \;

nix:
	@cd ./nix/nixos && ./install.sh

home:  dotfiles
	@cd ./nix/home-manager && ./install.sh
