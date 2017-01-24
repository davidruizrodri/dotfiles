# Aliases
# -----------------------------------------------

# -------------------------------------------------------------------
# Directory movement
# -------------------------------------------------------------------
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Directory shortcuts
alias projects='~/projects/'

# -------------------------------------------------------------------
# Unix
# -------------------------------------------------------------------
# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias c='clear'
alias k='kill -9'
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias l='ls --color'
alias -g G='| grep'
alias -g M='| less'
alias -g L='| wc -l'
alias -g ONE="| awk '{ print \$1}'"
alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias aliases='EDITOR\" ~/.aliases'
alias hosts='sudo \"\$EDITOR\" /etc/hosts'
alias paux='ps aux | grep'
alias chromium-unsecure="chromium-browser --disable-web-security"
alias zshrc='$EDITOR ~/.zshrc'
alias update-zsh='source ~/.zshrc'

# -------------------------------------------------------------------
# Git
# -------------------------------------------------------------------
alias gitka='gitk --all'

# -------------------------------------------------------------------
# Bundler
# -------------------------------------------------------------------
alias b="bundle"

# -------------------------------------------------------------------
# Apache
# -------------------------------------------------------------------
alias apachestart='sudo service apache2 start'
alias apachestop='sudo service apache2 stop'

# -------------------------------------------------------------------
# Ruby and Rails
# -------------------------------------------------------------------
# Tests and Specs
alias t='ruby -Itest'
testunitfocus(){
  ruby -Itest $1 -n /focus/
}
alias tfocus=testunitfoucs

# Rails
alias rake='noglob rake'
alias rs='rails server'
alias rc='rails console'
alias rg='rails generate'
alias routes='rake routes | grep'
alias migrate='rake db:migrate'
alias rollback='rake db:rollback'
alias tprepare='rake db:test:prepare'

# -------------------------------------------------------------------
# Databases
# -------------------------------------------------------------------
# Postgres
alias psqlaux='ps aux | grep postgre'
alias psqlstart='sudo service postgresql start'
alias psqlrestart='sudo service postgresql restart'

# -------------------------------------------------------------------
# Others
# -------------------------------------------------------------------
# Fix the swapped keys for the mac keyboard on Ubuntu
alias fix-keyboard='echo 0 | sudo tee /sys/module/hid_apple/parameters/iso_layout'

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# Overwrite dotfiles
alias overwrite-dotfiles='cd $HOME/.dotfiles; make clean; make'

# Alias ctags if you used homebrew
alias ctags="`brew --prefix`/bin/ctags"""

# Include custom aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local
