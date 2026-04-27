export DOTFILES="$HOME/.dotfiles"
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
  asdf
  autojump
  git
  git-extras
  macos 
  zsh-syntax-highlighting
  zsh-autosuggestions
)

SPACESHIP_CHAR_SYMBOL="❯ "
SPACESHIP_DIR_COLOR=yellow
SPACESHIP_GIT_BRANCH_COLOR=cyan
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_DOCKER_COMPOSE_SHOW=false

if [[ $TERM_PROGRAM == "WarpTerminal" ]]; then
  SPACESHIP_PROMPT_ASYNC=false
fi

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

source $ZSH/oh-my-zsh.sh

source "$HOME/.oh-my-zsh/custom/themes/spaceship.zsh-theme"

source "$DOTFILES/zsh/custom/aliases.zsh"
source "$DOTFILES/zsh/custom/bindkeys.zsh"
source "$DOTFILES/zsh/custom/editor.zsh"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Fix for rake task with brakets
# @link: https://thoughtbot.com/blog/how-to-use-arguments-in-a-rake-task
unsetopt nomatch

# qlty completions
[ -s "/usr/local/share/zsh/site-functions/_qlty" ] && source "/usr/local/share/zsh/site-functions/_qlty"

# qlty
export QLTY_INSTALL="$HOME/.qlty"
export PATH="$QLTY_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
