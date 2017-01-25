# Prompt
# -----------------------------------------------

# Load zsh git prompt
source ~/.dotfiles/zsh/git-prompt/git-prompt.plugin.zsh

local ret_status="%(?:%F{48}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %F{220}%c% %{$reset_color%}$(git_super_status) %# '

ZSH_THEME_GIT_PROMPT_PREFIX=" %F{48}git:%{$reset_color%}%F{243}( "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %F{243})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" %F{243}|%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CHANGED="%F{48}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BRANCH="%F{9}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{48}%{✔%G%}"
