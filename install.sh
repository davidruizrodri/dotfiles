#!/usr/bin/env bash
set -euo pipefail

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

# ── Helpers ───────────────────────────────────────────────────────────────────
log()  { echo "  + $*"; }
skip() { echo "  ~ $* (already exists, skipping)"; }

# ── Homebrew ──────────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  log "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  arch="$(uname -m)"
  HOMEBREW_PREFIX="$([[ "$arch" == "arm64" ]] && echo /opt/homebrew || echo /usr/local)"
  eval "$("$HOMEBREW_PREFIX/bin/brew" shellenv)"
fi

log "Installing packages from Brewfile"
brew update --force
brew bundle --file="$DOTFILES/Brewfile"

# ── Shell ─────────────────────────────────────────────────────────────────────
if [[ "$SHELL" != "$(command -v zsh)" ]]; then
  log "Changing shell to zsh"
  shell_path="$(command -v zsh)"
  if ! grep -q "$shell_path" /etc/shells; then
    sudo sh -c "echo $shell_path >> /etc/shells"
  fi
  sudo chsh -s "$shell_path" "$USER"
fi

# ── oh-my-zsh, spaceship, and zsh plugins ────────────────────────────────────
OMZ_DIR="$HOME/.oh-my-zsh"
OMZ_CUSTOM="$OMZ_DIR/custom"

if [[ -d "$OMZ_DIR" ]]; then
  skip "oh-my-zsh"
else
  log "Installing oh-my-zsh"
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

SPACESHIP_DIR="$OMZ_CUSTOM/themes/spaceship-prompt"
if [[ -d "$SPACESHIP_DIR" ]]; then
  skip "spaceship-prompt"
else
  log "Installing spaceship-prompt"
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$SPACESHIP_DIR"
  ln -sf "$SPACESHIP_DIR/spaceship.zsh-theme" "$OMZ_CUSTOM/themes/spaceship.zsh-theme"
fi

clone_plugin() {
  local repo="$1" name="$2"
  local dir="$OMZ_CUSTOM/plugins/$name"
  if [[ -d "$dir" ]]; then
    skip "$name"
  else
    log "Installing $name"
    git clone "$repo" "$dir"
  fi
}

clone_plugin https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting
clone_plugin https://github.com/zsh-users/zsh-autosuggestions.git     zsh-autosuggestions

# ── Remove broken symlinks left by the old Makefile system ───────────────────
log "Removing stale symlinks"
for link in \
  "$HOME/.gitconfig" "$HOME/.gitignore" "$HOME/.gitattributes" \
  "$HOME/.zshrc" "$HOME/.asdfrc" "$HOME/.gemrc" "$HOME/.irbrc" \
  "$HOME/.pryrc" "$HOME/.rspec" "$HOME/.ctags" "$HOME/.tmux.conf" \
  "$HOME/.ssh/config" "$HOME/.bundle/config"
do
  [[ -L "$link" && ! -e "$link" ]] && rm "$link"
done

# ── Stow all packages ─────────────────────────────────────────────────────────
log "Stowing dotfiles"
cd "$DOTFILES"
for package in git zsh warp; do
  log "stow $package"
  stow --target="$HOME" "$package"
done

# ── Powerline fonts ───────────────────────────────────────────────────────────
FONTS_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/fonts"
if [[ -d "$FONTS_DIR" ]]; then
  skip "powerline fonts"
else
  log "Installing powerline fonts"
  git clone https://github.com/powerline/fonts.git "$FONTS_DIR"
  sh "$FONTS_DIR/install.sh"
fi

# ── Local overrides ───────────────────────────────────────────────────────────
if [[ -f "$HOME/.laptop.local" ]]; then
  log "Running ~/.laptop.local"
  . "$HOME/.laptop.local"
fi

echo ""
echo "Done. Open a new shell to apply changes."
