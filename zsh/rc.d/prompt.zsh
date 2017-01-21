# Prompt
# -----------------------------------------------

# Load zsh git prompt
# TODO: Use oh-my-zsh framework
source ~/.dotfiles/zsh/git-prompt/git-prompt.plugin.zsh

ZSH_THEME_GIT_PROMPT_PREFIX="( "
ZSH_THEME_GIT_PROMPT_SUFFIX=" )"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" | "
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[cyan]%}✚"
PROMPT='%{$fg_bold[yellow]%}%m%~%b$(git_super_status) %# '
