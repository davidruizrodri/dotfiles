MY DOTFILES
-------
Clone onto your laptop:

```
> git clone git://github.com/davidruizrodri/dotfiles.git ~/.dotfiles
```

You can install them with `make`:

```
> make
# OR
> make install
```

And use the `clean` rule to uninstall them:

```
> make clean
```

If you want to install only one set of dotfiles, for example `git`, run:

```
> make git
# To clean
> make clean_git
```

## Makefile

If you check the `Makefile` you'll see that is quite simple. In fact, there is no rules to install anything. The trick is in this line:

```make
include **/*.mk
```

What the `Makefile` is doing here is searching for any `.mk` file in the directories' tree and if it finds one, it includes all of the file's rules.

The dotfiles for each app/module are in their own directory (e.g: `vim` or `zsh`), and inside those directories there is a `.mk` file (e.g: `vim.mk` or `zsh.mk`).

Each of these `.mk` files is a new `Makefile` with the rules to install that module. In order to make these `.mk` files to work with the main `Makefile`, they need to be created with a structure. This could be a template for a new module:

```make
MODULE := $(shell command -v module 2>/dev/null)

ifdef MODULE
	INSTALLERS += module
	CLEANERS   += clean_module

	MODULE_SRC_DIR := $(DOTFILES)/module
	MODULE_DST_DIR := $(CONFIG_DIR)/module

  .PHONY: module clean_module

  module: dotfile_install_module

  clean_module: dotfile_clean_module
else
	@echo "Module is not installed"
endif
```

The most important part of this file is when we append values to `INSTALLERS` and `CLEANERS` variables. These variables are the main registries of rules for installation and cleaning. They are used by the main `Makefile` to know what rules it should call when running the `install` and `clean` rules.

The `dotfile_install_%` and `dotfile_clean_%` rules are a simple way to show when a module starts its installation and cleaning rules. Add them as the first prerequisite of your rules to use them.

The idea is to keep each set of dotfiles modular, so if you need to add or remove something it shouldn't affect other files or the main installation process.

CREDITS
-------
Many thanks to Juan Hernández and Fran Casas to share their Makefile configuration in their dotfiles (https://github.com/jhbabon/dotfiles and https://github.com/franciscoj/dot-files). It has been really useful to make my own configuration! Thanks guys!
