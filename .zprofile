#
# ~/.zprofile
#

# better yaourt colors
#export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"
export EDITOR=nvim
export VISUAL=nvim

function launch-ssh-agent {
    if [ ! -S ~/.ssh/ssh_auth_sock ]; then
        eval `ssh-agent`
        ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
    fi
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
    ssh-add -l > /dev/null || ssh-add
}

# vi mode
# https://dougblack.io/words/zsh-vi-mode.html
# export KEYTIMEOUT=1
bindkey -v

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
    while true
    do
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
        if [ $exit_code -eq 0 ]
        then
            break
        fi
        sleep 1
    done
}

function tconnect {
    sshpass -p 12345678 ./scripts/manage_tools/transfer.sh $1
    connect $1
}

function diagram -d "Get classes diagram for python files" -w pyreverse {
    set dotfile "classes.dot"
    set pngfile "classes.png"
    pyreverse $argv
    if test $status != 0
    then
        return
    fi

    if test -f $dotfile
    then
        dot -Tpng:cairo:gd $dotfile -o $pngfile;
        xdg-open $pngfile;
        rm $dotfile;
        rm -i $pngfile;
    fi
}

function upload_py {
    cd ~/projects/mprdaemon
    git log -1 --pretty='%h %B' > /tmp/version
    echo On branch `git rev-parse --abbrev-ref HEAD` >> /tmp/version
    date >> /tmp/version
    g diff HEAD >> /tmp/version
    for host in $argv; do
        sshpass -p 12345678 scp /tmp/version root@$host:/root/version.diff
        sshpass -p 12345678 scripts/manage_tools/transfer.sh $host
        sleep 1
        sshpass -p 12345678 ssh -o "StrictHostKeyChecking=no" -t root@$host \
            'bash -ic "clear_logs; install_py --debug --clear-py --clear-xml -r $HOSTNAME; mprd_restart; exit"'
    done
}

function fix_machines {
    for host in $argv; do
sshpass -p 12345678 ssh root@$host <<'ENDSSH'
hostname vmmandmpls
mkdir /usr/lib/python3.6/mprdaemon
mkdir /usr/share/mprdaemon/cli
ENDSSH
    done
}

function bindiff {
    colordiff <(xxd $1) <(xxd $2)
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

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs virtualenv vi_mode)

POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1

# c-space to complete
bindkey '^ ' autosuggest-accept

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

eval $(keychain --eval --agents ssh -Q --quiet id_ed25519)
