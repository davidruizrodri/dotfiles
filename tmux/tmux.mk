TMUX := $(shell command -v tmux 2>/dev/null)

ifdef TMUX
	INSTALLERS += tmux
	CLEANERS   += clean_tmux

	TMUX_CONFIG_SRC  := $(DOTFILES)/tmux/tmux.conf
	TMUX_CONFIG      := $(DST_DIR)/.tmux.conf
	TMUX_PLUGINS_SRC := $(DOTFILES)/tmux/plugins/tpm
	TMUX_PLUGINS     := $(DST_DIR)/.tmux/plugins/tpm

  .PHONY: tmux clean_tmux

  $(TMUX_CONFIG):
		$(LINK) $(TMUX_CONFIG_SRC) $@
  $(TMUX_PLUGINS):
		$(LINK) $(TMUX_PLUGINS_SRC) $@

  tmux: dotfile_install_tmux $(TMUX_CONFIG) $(TMUX_PLUGINS)
  clean_tmux: dotfile_clean_tmux
		$(RM) $(TMUX_CONFIG)
		$(RM) $(TMUX_PLUGINS)
else
  @echo "Tmux is not installed"
endif
