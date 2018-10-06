ZSH_SHELL := $(shell command -v zsh 2>/dev/null)

ifdef ZSH_SHELL
	INSTALLERS += zsh
	CLEANERS   += clean_zsh

	ZSH_SRC_DIR   := $(DOTFILES)/zsh
	OH_MY_ZSH_DIR := $(HOME)/.oh-my-zsh

	ZSH_OH_MY_ZSH_REPO           := https://github.com/robbyrussell/oh-my-zsh.git
	SPACESHIP_PROMPT_REPO        := https://github.com/denysdovhan/spaceship-prompt.git
	ZSH_SYNTAX_HIGHLIGHTING_REPO := https://github.com/zsh-users/zsh-syntax-highlighting.git
	ZSH_AUTOSUGGESTIONS_REPO     := https://github.com/zsh-users/zsh-autosuggestions.git
	ZSH_CUSTOM_DIR               := $(OH_MY_ZSH_DIR)/custom
	ZSH_THEMES_DIR               := $(ZSH_CUSTOM_DIR)/themes
	ZSH_PLUGINS_DIR              := $(ZSH_CUSTOM_DIR)/plugins
	ZSHRC_SRC                    := $(ZSH_SRC_DIR)/zshrc
	ZSHRC                        := $(DST_DIR)/.zshrc

  .PHONY: zsh clean_zsh

  zsh: dotfile_install_zsh
		curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
		$(CLONE) $(SPACESHIP_PROMPT_REPO) $(ZSH_THEMES_DIR)/spaceship-prompt
		$(LINK)  $(ZSH_THEMES_DIR)/spaceship-prompt/spaceship.zsh-theme $(ZSH_THEMES_DIR)/spaceship.zsh-theme
		$(CLONE) $(ZSH_SYNTAX_HIGHLIGHTING_REPO) $(ZSH_PLUGINS_DIR)/zsh-syntax-highlighting
		$(CLONE) $(ZSH_AUTOSUGGESTIONS_REPO) $(ZSH_PLUGINS_DIR)/zsh-autosuggestions
		$(LINK) $(ZSH_SRC_DIR)/custom/aliases.zsh $(ZSH_CUSTOM_DIR)/aliases.zsh
		$(LINK) $(ZSH_SRC_DIR)/custom/bindkeys.zsh $(ZSH_CUSTOM_DIR)/bindkeys.zsh
		$(LINK) $(ZSH_SRC_DIR)/custom/editor.zsh $(ZSH_CUSTOM_DIR)/editor.zsh
		$(RM) $(ZSHRC)
		$(LINK) $(ZSHRC_SRC) $(ZSHRC)
  clean_zsh: dotfile_clean_zsh
		$(RM) $(OH_MY_ZSH_DIR)
		$(RM) $(ZSHRC)
else
  @echo "Zsh is not installed"
endif
