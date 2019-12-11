#
# ~/.zprofile
#

# better yaourt colors
#export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"
export EDITOR=nvim
export VISUAL=nvim
export MYTEX_DIR=~/tex

function launch-ssh-agent {
    if [ ! -S ~/.ssh/ssh_auth_sock ]; then
        eval `ssh-agent`
        ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
    fi
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
    ssh-add -l > /dev/null || ssh-add
}

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# for gpg in git to work
export GPG_TTY=$(tty)

export PATH=/usr/lib/ccache:$PATH
export CC="ccache gcc"
export HOSTCC="ccache gcc"
export HOSTCXX="ccache g++"
export CCACHE_DIR="~/.ccache"

function connect {
    for user in root admin serviceuser
    do
        echo "Trying to connect as '$user'"
        sshpass -p 12345678 ssh  -o "StrictHostKeyChecking=no" -q $user@$1
        exit_code=$?
        if [ $exit_code -eq 0 ]
        then
            break
        fi
    done
}

# errors to null
alias -g N='2>/dev/null'
# pipe to less
alias -g L='| less'
# pipe to grep
alias -g G='| grep'
# show only first n lines
alias -g H='| head -n '
# show only last n lines
alias -g T='| tail -n '
# edit output in nvim
alias -g V='> out && nvim out'

