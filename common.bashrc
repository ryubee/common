#if you want to know more color option, see this http://misc.flogisoft.com/bash/tip_colors_and_formatting

# If bash does not exist, return
if [ -z "$PS1" ]; then
    return
fi

# source system wide aliases
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

#stty sane
#if [ "`stty | grep erase`" = "" ] ; then
#    stty erase 
#fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

function share_history {
    history -a
    history -c
    history -r
}


# console style
if [ "${CONTAMI}" = 1 ]; then
    echo ""
else 
    export BASHMON='\[\e[48;5;33m\]\[\e[38;5;230m\](*ﾟﾛﾟ)< \@ '
fi

TMP_PS=${BASHMON}'\[\e[00m\]\[\e[38;5;81m\][\w]\[\e[00m\]\r\n\[\e[38;5;202m\]\u\[\e[38;5;123m\]@\[\e[38;5;198m\]\h:\[\e[38;5;81m\]\W\[\e[00m\]\$ '

if [ "`echo $TERM | grep 'screen'`" != "" ]; then
    export PS1=${TMP_PS}
    export PROMPT_COMMAND='echo -ne "\033k\033\0134\033k$(basename $(pwd))\033\\";share_history'
    ## Current command name as window name
    #export PS1='\[\033k\033\\\][\u@\h \W]\$ '
    #export PS1='\[\033k\033\\\]\u@\h:\W\$ '
    ## PWD as window name
    #export PS1='\u@\h:\W\$ '
    #export PROMPT_COMMAND='echo -ne "\033k$(basename $(pwd))\033\\"'
    ## PWD when no command is running, otherwise current command name as window name
    #export PS1='\u@\h:\W\$ '
    #export PROMPT_COMMAND='echo -ne "\033k\033\0134\033k$(basename $(pwd))\033\\"'
    ## Above with a shared history among all terminals
    #export PS1='\[\e[1;32m\]\u\[\e[36m\]@\[\e[32m\]\h:\[\e[34m\]\W\[\e[0m\]$ '
    #export PS1='\u@\h:\W\$ '
##    export PS1='\[\e[1;38;5;32m\]${BASHMON}\[\e[1;38;5;75m\]\@\[\e[00m\] \[\e[38;5;35m\][\w]\n\[\e[38;5;214m\]\u\[\e[38;5;196m\]@\[\e[38;5;47m\]\h:\[\e[38;5;47m\]\W\[\e[00m\]\$ '
else
    export PS1=${TMP_PS}
    export PROMPT_COMMAND='share_history'
    #export PS1='\u@\h:\W\$ '
    #export PS1='\[\e[1;33m\](*ﾟﾛﾟ)< \[\e[1;31m\]\@ \[\e[34m\][\w]\n\[\e[1;36m\]\u\[\e[35m\]@\[\e[32m\]\h:\[\e[34m\]\W\[\e[00m\]\$ '
    #export PS1='\u@\h:\W\$ '
    ## With a shared history among all terminals
##    export PS1='\[\e[1;38;5;32m\]${BASHMON}\[\e[1;38;5;75m\]\@\[\e[00m\] \[\e[38;5;35m\][\w]\n\[\e[38;5;214m\]\u\[\e[38;5;196m\]@\[\e[38;5;47m\]\h:\[\e[38;5;47m\]\W\[\e[00m\]\$ '
fi

# ls color
if [ `uname` = "Linux" ]; then
    alias ls='ls -NF --show-control-chars'
    alias ls='ls --color=auto -NF --show-control-chars'
    # if you use color ls, comment out above line and uncomment below 2 lines.
    LS_COLORS='no=00;38;5;118:fi=00:di=00;38;5;81:ln=00;38;5;12:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.i386.rpm=01;31:*.src.rpm=01;30:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.c=01;38;5;220:*.h=01;38;5;220:*.cpp=01;38;5;220:*.v=01;38;5;214:*.sv=01;38;5;214:*.vhd=01;38;5;214:*.vhdl=01;38;5;214:' ; export LS_COLORS
    alias rm='rm -i'
    alias cp='cp -i'
    alias mv='mv -i'
    alias ll='ls -lsXh'
    alias la='ls -aFX'
    alias sc='screen -D -RR'
    alias open='xdg-open'
    alias pr_sync='watch grep -e Dirty: -e Writeback: /proc/meminfo'
    alias :q='exit'
    alias vims='vim -S ~/.vim.session'

    alias ghc='stack ghc --'
    alias ghci='stack ghci --'
    alias runhaskell='stack runhaskell --'

    if [ $(arch) = "aarch64" ];then
        echo $(arch) "vim is banira"
        alias vim='vim -u NONE -N'
    fi
elif [ `uname` = 'FreeBSD' ]; then
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -G'
fi

# ssh-agent
alias sshkey='eval `cat ${SSH_AGENT_FILE}`'
alias sshrm='rm -f ${SSH_AGENT_FILE}'
SSH_AGENT_FILE="${HOME}/.ssh/.ssh-agent.`hostname`"
if [ -f ${SSH_AGENT_FILE} ]; then
    eval `cat ${SSH_AGENT_FILE}`
    ssh_agent_exist=0    
    for id in `ps ax|grep 'ssh-agent'|sed -e 's/\([0-9]\+\).*/\1/'`
    do 
        if [ ${SSH_AGENT_PID} = ${id} ]
        then 
            ssh_agent_exist=1
        fi
    done
    if [ $ssh_agent_exist = 0 ]
    then
        rm -f ${SSH_AGENT_FILE}
        ssh-agent > ${SSH_AGENT_FILE}
        chmod 600 ${SSH_AGENT_FILE}
        eval `cat ${SSH_AGENT_FILE}`
        ssh-add
    fi
else
    ssh-agent > ${SSH_AGENT_FILE}
    chmod 600 ${SSH_AGENT_FILE}
    eval `cat ${SSH_AGENT_FILE}`
    ssh-add
fi

# machine specific .bashrc
if [ -f .`hostname`/dot.bashrc.bash ] ; then
    source .`hostname`/dot.bashrc.bash
fi

# PATH
export PATH="$HOME/.cargo/bin:$PATH"
if [[ -z $TMUX ]]; then
    export PATH=~/script:$PATH
    export PATH=~/Work/utils:$PATH
    export PATH=/usr/local/bin:$PATH
    export PATH=/home/ryusuke-y/.local/bin:$PATH
fi
case "${HOSTNAME}" in
    "cad111.naist.jp"|"cad112.naist.jp"|"cad113.naist.jp"|"cad114.naist.jp")
        echo ${HOSTNAME}
        ;;
    "arch09.naist.jp"|"cad103.naist.jp"|"cad104.naist.jp"|"cad105.naist.jp"|"cad106.naist.jp"|"cad110.naist.jp")
        echo ${HOSTNAME}
        ;;
    "cad117")
        echo ${HOSTNAME}
#         export GOPATH=$HOME/.golang/package
#         export PYENV_ROOT="${HOME}/.pyenv"
#         export PATH="${PYENV_ROOT}/bin:${PATH}"
#         eval "$(pyenv init -)"
#         pyenv global anaconda3-4.3.1
        ;;
    "cad116")
        echo ${HOSTNAME}
        ;;
    "cad115")
        echo ${HOSTNAME}
        ;;
    "cad118")
        echo ${HOSTNAME}
        ;;
    *)
        echo "${HOSTNAME} Didn't match anything"
esac

export LD_LIBRARY_PATH="/usr/local/libevent-2.1.8-stable/lib:$LD_LIBRARY_PATH"

function dict() {
  grep $1 ${HOME}/Work/Dict/gene.txt -A 1 -wi --color
}

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESSCHARSET=utf-8

export EDITOR='vi'
export SVN_SSH='ssh -q'

#export HISTCONTROL=ignoreboth
export HISTCONTROL=ignoredups
export HISTIGNORE="cd*:pwd*:fg*:bg*"
export HISTSIZE=10000

export TERM='xterm-256color'
















#export CROSS_COMPILE=aarch64-linux-gnu-
#export ARCH=arm64
#export CROSS_COMPILE=arm-xilinx-linux-gnueabi-
#export ARCH=arm

export ACTIVE=~/Work/Active/EMAXVI
alias oij='cd /home/yamano/work/root_docker/'



