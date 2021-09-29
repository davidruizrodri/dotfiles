INSTALLERS += iterm
CLEANERS   += clean_iterm

ITERM_SRC_DIR   := $(DOTFILES)/iterm
ITERM_CONFIG_DIR := $(CONFIG_DIR)/iterm2

.PHONY: iterm clean_iterm

iterm: dotfile_install_iterm
	$(MKDIR) $(CONFIG_DIR)/iterm2
	$(COPY) $(ITERM_SRC_DIR)/Snazzy.itermcolors $(ITERM_CONFIG_DIR)
clean_iterm: dotfile_clean_iterm
	$(RM) $(ITERM_CONFIG_DIR)
