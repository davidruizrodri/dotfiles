CTAGS := $(shell command -v ctags 2>/dev/null)

ifdef CTAGS
	INSTALLERS += ctags
	CLEANERS   += clean_ctags

	CTAGS_CONFIG_SRC := $(DOTFILES)/ctags/ctags
	CTAGS_CONFIG     := $(DST_DIR)/.ctags

  .PHONY: ctags clean_ctags

  $(CTAGS_CONFIG):
		$(LINK) $(CTAGS_CONFIG_SRC) $@

  ctags: dotfile_install_ctags $(CTAGS_CONFIG)
  clean_ctags: dotfile_clean_ctags
		$(RM) $(CTAGS_CONFIG)
else
  @echo "Ctags is not installed"
endif
