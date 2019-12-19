alias v=$EDITOR
alias vc='nvim ~/.config/nvim/init.vim'

# colored apps
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'

alias cp="cp -i"            # confirm before overwriting something
alias rm="trash"            # uses trash-cli
alias mv="mv -i"            # confirm before overwriting something
alias df='df -h'            # human-readable sizes
alias free='free -m'        # show sizes in MB
alias vim='nvim'
alias more=less

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias lla='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -a --group-directories-first --color=auto -F'

alias g="git"
alias gc="git commit"
alias gca="git commit --amend"
alias grb="git rebase"
alias grbi="git rebase --interactive"

alias ga='git add -p'
alias gs='git status'
alias gm='git merge --no-ff'
alias gh='git hist'
alias gha='git hist --all'
alias go='git checkout'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias show_machines='curl "http://10.10.12.251/machines?subnet=test-204"'
alias mnt_tmp='sudo vmhgfs-fuse .host:/tmp /mnt/hgfs/tmp/ -o allow_other -o uid=1000'
alias mnt_study='sudo vmhgfs-fuse .host:/study /mnt/hgfs/study/ -o allow_other -o uid=1000'

alias ff='grep --exclude-dir={.mypy_cache,.ropeproject} -rnw . -B 5 -A 5 -e'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
