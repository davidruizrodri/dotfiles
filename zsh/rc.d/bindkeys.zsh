# Bindkeys
# -----------------------------------------------

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# Handy keybindings
bindkey "^B" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^F" forward-word
bindkey "^D" backward-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"
