SPACEMACS := $(shell command -v emacs 2>/dev/null)

ifdef SPACEMACS
	INSTALLERS += spacemacs
	CLEANERS   += clean_spacemacs

	SPACEMACS_CONFIG_SRC := $(DOTFILES)/editors/spacemacs/spacemacs
	SPACEMACS_CONFIG     := $(DST_DIR)/.spacemacs

  .PHONY: spacemacs clean_spacemacs

  $(SPACEMACS_CONFIG):
		$(LINK) $(SPACEMACS_CONFIG_SRC) $@

  spacemacs: dotfile_install_spacemacs $(SPACEMACS_CONFIG)
  clean_spacemacs: dotfile_clean_spacemacs
		$(RM) $(SPACEMACS_CONFIG)
else
  @echo "Spacemacs is not installed"
endif
