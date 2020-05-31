alias c='clear'

alias hosts='sudo \"\$EDITOR\" /etc/hosts'
alias zshrc='$EDITOR ~/.zshrc'
alias update-zsh='source ~/.zshrc'

alias gitka='gitk --all'

alias overwrite-dotfiles='cd $HOME/.dotfiles; make clean; make'

gdiff() {
  preview="git diff $@ --color=always -- {-1}"
  git diff $@ --name-only | fzf -m --ansi --preview $preview
}
