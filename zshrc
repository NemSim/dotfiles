export GOPATH=$HOME/go

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

export PATH="/usr/local/sbin:$PATH"

# tmux
alias tmxls='tmux ls'
alias tmxnew='tmux new-session -s'
alias tmxcon='tmux attach -t'

# git
alias gl='git log'
alias gst='git status'
alias gd='git diff'
alias gbr='git branch'
alias gco='git checkout'
alias gcm='git commit -m'
alias gcom='git checkout master'
alias gcob='git checkout -b'

# vlc
# alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
