GIT := $(shell command -v git 2>/dev/null)

ifdef GIT
	INSTALLERS += git
	CLEANERS   += clean_git

	GIT_SRC_DIR       := $(DOTFILES)/git
	GITCONFIG_SRC     := $(GIT_SRC_DIR)/gitconfig
	GITCONFIG         := $(DST_DIR)/.gitconfig
	GITIGNORE_SRC     := $(GIT_SRC_DIR)/gitignore
	GITIGNORE         := $(DST_DIR)/.gitignore
	GITATTRIBUTES_SRC := $(GIT_SRC_DIR)/gitattributes
	GITATTRIBUTES     := $(DST_DIR)/.gitattributes

  .PHONY: git clean_git

  $(GITCONFIG):
		$(LINK) $(GITCONFIG_SRC) $@
  $(GITIGNORE):
		$(LINK) $(GITIGNORE_SRC) $@
  $(GITATTRIBUTES):
		$(LINK) $(GITATTRIBUTES_SRC) $@

  git: dotfile_install_git $(GITCONFIG) $(GITIGNORE) $(GITATTRIBUTES)
  clean_git: dotfile_clean_git
		$(RM) $(GITCONFIG)
		$(RM) $(GITIGNORE)
		$(RM) $(GITATTRIBUTES)
else
  @echo "Git is not installed"
endif
