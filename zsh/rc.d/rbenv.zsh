# Rbenv
# -----------------------------------------------

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - --no-rehash)"

# Clear variable in order to use .ruby-version as Ruby version
unset RBENV_VERSION
