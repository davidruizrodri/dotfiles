TMUX := $(shell command -v tmux 2>/dev/null)

ifdef TMUX
	INSTALLERS += tmux
	CLEANERS   += clean_tmux

	TMUX_CONFIG_SRC   := $(DOTFILES)/tmux/tmux.conf
	TMUX_CONFIG       := $(DST_DIR)/.tmux.conf
	TMUX_PLUGINS_DIR  := $(DST_DIR)/.tmux/plugins/tpm
	TMUX_PLUGINS_REPO := https://github.com/tmux-plugins/tpm

  .PHONY: tmux clean_tmux

  tmux: dotfile_install_tmux 
		$(LINK) $(TMUX_CONFIG_SRC) $(TMUX_CONFIG)
		$(CLONE) $(TMUX_PLUGINS_REPO) $(TMUX_PLUGINS_DIR)
  clean_tmux: dotfile_clean_tmux
		$(RM) $(TMUX_CONFIG)
		$(RM) $(TMUX_PLUGINS_DIR)
else
  @echo "Tmux is not installed"
endif
