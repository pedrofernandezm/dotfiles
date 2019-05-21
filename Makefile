SHELL := /bin/bash

setup:
	@./scripts/setup.sh

dotfiles:
	@./scripts/dotfiles.sh

vim:
	@./scripts/vim.sh

zsh:
	@./scripts/zsh.sh

tools:
	@./scripts/tools.sh
