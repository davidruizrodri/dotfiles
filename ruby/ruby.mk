RUBY := $(shell command -v ruby 2>/dev/null)

ifdef RUBY
	INSTALLERS += ruby
	CLEANERS   += clean_ruby

	RUBY_SRC_DIR      := $(DOTFILES)/ruby
	BUNDLE_CONFIG_SRC := $(RUBY_SRC_DIR)/bundle/config
	BUNDLE_CONFIG     := $(DST_DIR)/.bundle/config
	GEMRC_SRC         := $(RUBY_SRC_DIR)/gemrc
	GEMRC             := $(DST_DIR)/.gemrc
	IRBRC_SRC         := $(RUBY_SRC_DIR)/irbrc
	IRBRC             := $(DST_DIR)/.irbrc
	PRYRC_SRC         := $(RUBY_SRC_DIR)/pryrc
	PRYRC             := $(DST_DIR)/.pryrc
	RSPEC_SRC         := $(RUBY_SRC_DIR)/rspec
	RSPEC             := $(DST_DIR)/.rspec
	ASDFRC_SRC        := $(RUBY_SRC_DIR)/asdfrc
	ASDFRC            := $(DST_DIR)/.asdfrc

  .PHONY: ruby clean_ruby

  $(BUNDLE_CONFIG):
		$(LINK) $(BUNDLE_CONFIG_SRC) $@
  $(GEMRC):
		$(LINK) $(GEMRC_SRC) $@
  $(IRBRC):
		$(LINK) $(IRBRC_SRC) $@
  $(PRYRC):
		$(LINK) $(PRYRC_SRC) $@
  $(RSPEC):
		$(LINK) $(RSPEC_SRC) $@
  $(ASDFRC):
		$(LINK) $(ASDFRC_SRC) $@

  ruby: dotfile_install_ruby $(PRYRC) $(IRBRC) $(RSPEC) $(GEMRC) $(BUNDLE_CONFIG) $(ASDFRC)
  clean_ruby: dotfile_clean_ruby
		$(RM) $(BUNDLE_CONFIG)
		$(RM) $(GEMRC)
		$(RM) $(IRBRC)
		$(RM) $(PRYRC)
		$(RM) $(RSPEC)
		$(RM) $(ASDFRC)
else
  @echo "Ruby is not installed"
endif
