# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Installation

```sh
./install.sh
```

Idempotent — safe to re-run. Each step is guarded and skips if already installed.

What it does, in order:
1. Installs Homebrew if not present
2. Runs `brew bundle` to install all packages and apps from `Brewfile`
3. Changes the default shell to zsh if needed
4. Installs oh-my-zsh, spaceship-prompt, zsh-syntax-highlighting, zsh-autosuggestions
5. Runs `stow <package>` for every package
6. Clones and installs powerline fonts
7. Sources `~/.laptop.local` if present (machine-specific overrides)

## Architecture

Dotfiles are managed with **GNU Stow**. Each top-level directory is a Stow package. Stow mirrors the directory tree inside the package folder into `$HOME`, creating symlinks.

```
git/.gitconfig        → ~/.gitconfig
warp/.warp/...        → ~/.warp/...
```

**The nesting rule:** files that belong at `~/.foo` must live at `<package>/.foo`.

To stow a single package manually:
```sh
stow --target="$HOME" git
stow --target="$HOME" -D git  # unstow (remove symlinks)
```

## Adding a New Package

1. Create a directory: `<tool>/`
2. Inside it, mirror the path the file should have in `$HOME`. For example, a file that belongs at `~/.config/foo/bar.conf` goes at `<tool>/.config/foo/bar.conf`.
3. Add the package name to the `for package in ...` loop in `install.sh`.

## Adding a New App or Tool

Add it to `Brewfile` and run `brew bundle`. Use `brew bundle check` to see what's missing without installing.

## Zsh Custom Files

`zsh/custom/aliases.zsh`, `bindkeys.zsh`, and `editor.zsh` are sourced directly from `$DOTFILES` in `.zshrc`. They do **not** go through oh-my-zsh's custom directory.

## Git Hooks (Templates)

Hooks in `git/templates/hooks/` are automatically copied to every new git repo via `templatedir = ~/.dotfiles/git/templates` in `.gitconfig`:

- **`pre-commit`** — blocks commits containing debug keywords (`debugger`, `console.log`, `byebug`, `binding.pry`, conflict markers)
- **`prepare-commit-msg`** — auto-prepends the Jira issue key extracted from the branch name (e.g., `feature/PROJ-123-foo` → `[PROJ-123] your message`)

To apply the hooks to an existing repo, run `git init` inside it.

## Machine-specific Overrides

`~/.laptop.local` is sourced at the end of `install.sh` if it exists. Use it for machine-specific setup that shouldn't be committed to the repo.

## Notable Configuration Details

- **Git**: fast-forward-only merges, rebase-based pulls with autostash, `push.autoRemoteSetup = true`.
- **Zsh**: Spaceship battery widget disabled. `SPACESHIP_PROMPT_ASYNC=false` set for Warp terminal compatibility.
- **Claude**: `claude/.claude/statusline.sh` is stowed to `~/.claude/statusline.sh`. The `settings.json` is intentionally not tracked (contains machine-specific secrets); configure `statusLine` in it manually to point at `~/.claude/statusline.sh`.
