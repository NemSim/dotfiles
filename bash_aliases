alias up='cd ..'


alias tmxnew='tmux new-session -s'
alias tmxcon='tmux attach -t'
alias tmxls='tmux ls'

alias gcm='git commit --message'
alias gcam='git commit -a --message'

# alias gaam='git commit -a --amend --no-edit'
# alias gcom='git checkout master'
# alias gbr='git branch'
# alias gst='git status'
# alias glast='git log -n 1 -p'

# Ambient engine noise
# requires package sox
# http://www.reddit.com/r/commandline/comments/29le5u/generate_your_own_ambient_tng_enterprise_engine/
# alias warp="play -c 2 -n -c1 synth whitenoise lowpass -1 120 lowpass -1 120 lowpass -1 120 gain +10"

# Pomodoro
# alias startpom="thyme && thyme -b"

# Matrix
# alias matrix='cmatrix -abs' # closes with a key

# calendar with todays date
alias tcal='cal | grep --before-context 6 --after-context 6 --color -e " $(date +%e) " -e "^$(date +%e)"'

# this week
alias tweek='cal | grep --color -e " $(date +%e) " -e "^(date +%e)"'


