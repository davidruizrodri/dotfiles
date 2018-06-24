INSTALLERS += fonts
CLEANERS   += clean_fonts

FONTS_SRC_FOLDER := $(DOTFILES)/fonts
FONTS_DST_FOLDER := $(DST_DIR)/Library/Fonts

.PHONY: fonts clean_fonts

fonts: dotfile_install_fonts
	$(COPY) $(FONTS_SRC_FOLDER)/*.otf $(FONTS_DST_FOLDER)
clean_fonts: dotfile_clean_fonts
	$(RM) $(FONTS_DST_FOLDER)/*.otf
