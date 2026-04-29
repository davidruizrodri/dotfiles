MY DOTFILES
-------

Clone onto your laptop:

```sh
git clone git@github.com:davidruizrodri/dotfiles.git ~/.dotfiles
```

Install everything:

```sh
cd ~/.dotfiles
./install.sh
```

Idempotent — safe to re-run. The script will:

1. Install Homebrew (if not present)
2. Install all packages and apps via `Brewfile`
3. Install Claude Code
4. Change default shell to zsh (if needed)
5. Install oh-my-zsh, spaceship prompt, and zsh plugins
6. Stow all dotfile packages into `$HOME`
7. Install powerline fonts
8. Prompt for corporate git email (written to `~/.gitconfig.local`)
9. Prompt for AWS default region (written to `~/.aws/config`)

## Adding a new app

Add it to `Brewfile` and run `brew bundle`.

## Adding a new dotfile package

1. Create a directory `<tool>/`
2. Mirror the file's path in `$HOME` inside it — e.g. `<tool>/.config/foo/bar.conf`
3. Add the package name to the `for package in ...` loop in `install.sh`

## Machine-specific overrides

`~/.laptop.local` is sourced at the end of `install.sh` if it exists. Use it for anything that shouldn't be committed to the repo.
