SSH := $(shell command -v ssh 2>/dev/null)

ifdef SSH
	INSTALLERS += ssh
	CLEANERS   += clean_ssh

	SSH_CONFIG_SRC := $(DOTFILES)/ssh/config
	SSH_CONFIG     := $(DST_DIR)/.ssh/config

  .PHONY: ssh clean_ssh

  $(SSH_CONFIG):
		$(LINK) $(SSH_CONFIG_SRC) $@

  ssh: dotfile_install_ssh $(SSH_CONFIG)
  clean_ssh: dotfile_clean_ssh
		$(RM) $(SSH_CONFIG)
else
  @echo "SSH is not installed"
endif
