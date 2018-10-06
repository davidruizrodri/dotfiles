ZSH := $(shell command -v zsh 2>/dev/null)

ifdef ZSH
	INSTALLERS += zsh
	CLEANERS   += clean_zsh

	ZSH_SRC_DIR   := $(DOTFILES)/zsh
	OH_MY_ZSH_DIR := $(HOME)/.oh-my-zsh

	ZSH_OH_MY_ZSH_REPO           := https://github.com/robbyrussell/oh-my-zsh.git
	ZSH_SYNTAX_HIGHLIGHTING_REPO := https://github.com/zsh-users/zsh-syntax-highlighting.git
	ZSH_AUTOSUGGESTIONS_REPO     := https://github.com/zsh-users/zsh-autosuggestions.git
	ZSH_PLUGINS_DIR              := $(ZSH_CUSTOM)/plugins
	ZSHRC_SRC                    := $(ZSH_SRC_DIR)/zshrc
	ZSHRC                        := $(DST_DIR)/.zshrc

  .PHONY: zsh clean_zsh

	$(ZSH_OH_MY_ZSH_CLONE):
		$(CLONE) $(ZSH_OH_MY_ZSH_REPO) $(OH_MY_ZSH_DIR)
  $(ZSH_SYNTAX_HIGHLIGHTING_CLONE):
		$(CLONE) $(ZSH_SYNTAX_HIGHLIGHTING_REPO) $(ZSH_PLUGINS_DIR)/zsh-syntax-highlighting
	$(ZSH_AUTOSUGGESTIONS_CLONE):
		$(CLONE) $(ZSH_AUTOSUGGESTIONS_REPO) $(ZSH_PLUGINS_DIR)/zsh-autosuggestions
  $(ZSH_CUSTOM_COPY):
		$(LINK) $(ZSH_SRC_DIR)/aliases.zsh $(ZSH_CUSTOM)/aliases.zsh
		$(LINK) $(ZSH_SRC_DIR)/bindkeys.zsh $(ZSH_CUSTOM)/bindkeys.zsh
		$(LINK) $(ZSH_SRC_DIR)/editor.zsh $(ZSH_CUSTOM)/editor.zsh
  $(ZSHRC):
		$(LINK) $(ZSHRC_SRC) $@

  zsh: dotfile_install_zsh $(ZSH_OH_MY_ZSH_CLONE) $(ZSH_SYNTAX_HIGHLIGHTING_CLONE) $(ZSH_AUTOSUGGESTIONS_CLONE) $(ZSH_CUSTOM_COPY) $(ZSHRC)
  clean_zsh: dotfile_clean_zsh
		$(RM) $(OH_MY_ZSH_DIR)
		$(RM) $(ZSH_PLUGINS_DIR)/zsh-syntax-highlighting
		$(RM) $(ZSH_PLUGINS_DIR)/zsh-autosuggestions
		$(RM) $(ZSH_CUSTOM)/aliases.zsh
		$(RM) $(ZSH_CUSTOM)/bindkeys.zsh
		$(RM) $(ZSH_CUSTOM)/editor.zsh
		$(RM) $(ZSHRC)
else
  @echo "Zsh is not installed"
endif
