INSTALLERS += fonts
CLEANERS   += clean_fonts

POWERLINE_FONTS_DIR  := $(CONFIG_DIR)/fonts
POWERLINE_FONTS_REPO := https://github.com/powerline/fonts.git

.PHONY: fonts clean_fonts

fonts: dotfile_install_fonts
	$(CLONE) $(POWERLINE_FONTS_REPO) $(POWERLINE_FONTS_DIR)
	$(EXECUTE) $(POWERLINE_FONTS_DIR)/install.sh
clean_fonts: dotfile_clean_fonts
	$(EXECUTE) $(CONFIG_DIR)/fonts/uninstall.sh
