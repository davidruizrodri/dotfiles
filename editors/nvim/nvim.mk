NVIM := $(shell command -v nvim 2>/dev/null)

ifdef NVIM
	INSTALLERS += nvim
	CLEANERS   += clean_nvim

	NVIM_SRC_DIR        := $(DOTFILES)/editors/nvim
	NVIM_DST_DIR        := $(CONFIG_DIR)/nvim
	NVIM_INIT           := $(NVIM_DST_DIR)/init.vim
	NVIM_PLUG_URL       := https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	NVIM_PLUG           := $(NVIM_DST_DIR)/autoload/plug.vim

  .PHONY: nvim clean_nvim

  $(NVIM_INIT): $(NVIM_DST_DIR)
		$(LINK) $(NVIM_SRC_DIR)/init.vim $@
  $(NVIM_DST_DIR):
		$(MKDIR) $@
  $(NVIM_PLUG):
		$(MKDIR) $(@D)
		curl -fLo $@ $(NVIM_PLUG_URL)
		nvim +PlugInstall +qa

  nvim: dotfile_install_nvim $(NVIM_INIT) $(NVIM_PLUG)
  clean_nvim: dotfile_clean_nvim
		$(RM) $(NVIM_INIT)
		$(RM) $(NVIM_DST_DIR)
else
	@echo "Nvim is not installed"
endif
