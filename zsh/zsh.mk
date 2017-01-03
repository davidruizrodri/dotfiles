ZSH := $(shell command -v zsh 2>/dev/null)

ifdef ZSH
	INSTALLERS += zsh
	CLEANERS   += clean_zsh

	ZSH_SRC_DIR          := $(DOTFILES)/zsh
	ZSH_DST_DIR          := $(CONFIG_DIR)/zsh
	ZSH_COMPLETIONS_REPO := https://github.com/zsh-users/zsh-completions.git
	ZSH_COMPLETIONS_DIR  := $(ZSH_DST_DIR)/completions
	ZSHRC_SRC            := $(ZSH_SRC_DIR)/zshrc
	ZSHRC                := $(DST_DIR)/.zshrc
	ALIASES_SRC          := $(ZSH_SRC_DIR)/aliases
	ALIASES              := $(DST_DIR)/.aliases
	ENV_SRC              := $(ZSH_SRC_DIR)/env
	ENV                  := $(DST_DIR)/.env

  .PHONY: zsh clean_zsh

  $(ZSH_COMPLETIONS_DIR): $(ZSH_DST_DIR)
		$(CLONE) $(ZSH_COMPLETIONS_REPO) $(ZSH_SRC_DIR)/completions
		$(LINK) $(ZSH_SRC_DIR)/completions $@
  $(ZSH_DST_DIR):
		$(MKDIR) $@
  $(ZSHRC):
		$(LINK) $(ZSHRC_SRC) $@
  $(ALIASES):
		$(LINK) $(ALIASES_SRC) $@
  $(ENV):
		$(LINK) $(ENV_SRC) $@

  zsh: dotfile_install_zsh $(ZSH_COMPLETIONS_DIR) $(ZSHRC) $(ALIASES) $(ENV)
  clean_zsh: dotfile_clean_zsh
		$(RM) $(ZSH_COMPLETIONS_DIR)
		$(RM) $(ZSH_SRC_DIR)/completions
		$(RM) $(ZSHRC)
		$(RM) $(ALIASES)
		$(RM) $(ENV)
else
  @echo "Zsh is not installed"
endif
