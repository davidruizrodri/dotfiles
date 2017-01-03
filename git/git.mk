GIT := $(shell command -v git 2>/dev/null)

ifdef GIT
	INSTALLERS += git
	CLEANERS   += clean_git

	GIT_SRC_DIR   := $(DOTFILES)/git
	GITCONFIG_SRC := $(GIT_SRC_DIR)/gitconfig
	GITCONFIG     := $(DST_DIR)/.gitconfig
	GITIGNORE_SRC := $(GIT_SRC_DIR)/gitignore
	GITIGNORE     := $(DST_DIR)/.gitignore

  .PHONY: git clean_git

  $(GITCONFIG):
		$(LINK) $(GITCONFIG_SRC) $@
  $(GITIGNORE):
		$(LINK) $(GITIGNORE_SRC) $@

  git: dotfile_install_git $(GITCONFIG) $(GITIGNORE)
  clean_git: dotfile_clean_git
		$(RM) $(GITCONFIG)
		$(RM) $(GITIGNORE)
else
  @echo "Git is not installed"
endif
