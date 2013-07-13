################################################################################
#
# ~/.bashrc
# 
# This is my bash configuration file. Most of the paths are personnal so you
# will have to adapt them to your machine.
#
# Maintainer: Bruno Parmentier
#
################################################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

################################################################################
# PS1 Variables
################################################################################

#PS1='[\u@\h \W]\$ '
#PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
PS1='\n\[\033[0;32m\]\u@\h \[\033[1;33m\]\w\n\[\033[0m\]> '
#PS1='\n\[\033[0;32m\]\u\[\033[0m\]@\[\033[0;32m\]\h \[\033[1;33m\]\w\n\[\033[0m\]> '

################################################################################
# Custom aliases
################################################################################

# ls
alias ls='ls -hF --group-directories-first --color=auto'
alias lr='ls -R'                            # recursive
alias ll='ls -lhXv --time-style=long-iso'   # detailled list
alias la='ll -A'                            # all files
alias lx='ll -BX'                           # sort by extension
alias lz='ll -rS'                           # sort by size
alias lt='ll -rt'                           # sort by date
alias lm='la | more'

# cd
alias ..='cd ..'
alias cdesi='cd ~/Documents/ESI/'
alias cdang='cd ~/Documents/ESI/ANG'
alias cdanl='cd ~/Documents/ESI/ANL'
alias cdbdo='cd ~/Documents/ESI/BDO'
alias cditr='cd ~/Documents/ESI/ITR'
alias cdjav='cd ~/Documents/ESI/JAV'
alias cdljv='cd ~/Documents/ESI/LJV'
alias cdlmc='cd ~/Documents/ESI/LMC'
alias cdlog='cd ~/Documents/ESI/LOG'
alias cdlph='cd ~/Documents/ESI/LPH'
alias cdmat='cd ~/Documents/ESI/MAT'
alias cdmcr='cd ~/Documents/ESI/MCR'
alias cdmpr='cd ~/Documents/ESI/MPR'
alias cdphy='cd ~/Documents/ESI/PHY'
alias cdsta='cd ~/Documents/ESI/STA'
alias cdstr='cd ~/Documents/ESI/STR'
alias cdsys='cd ~/Documents/ESI/SYS'

# du
alias du='du -h'

# rm
alias rm='rm -I'
#alias rm="mv $ ~/.trash/"                  # don't remove file(s) directly?

# Java
alias jvdc='javadoc -charset "utf-8" -d doc *.java'
alias jvc='javac -d ~/Documents/ESI/LJV/classes'
alias jvtest='java org.junit.runner.JUnitCore'

# Path Variables (shows one path per line)
alias path='echo -e ${PATH//:/\\n}'
alias classpath='echo -e ${CLASSPATH//:/\\n}'

# Various
alias clr='clear'
alias pingg='ping -c 3 www.google.com'
alias su='su -'
alias horaire='cd /home/bp/Documents/ESI/ && mupdf Tech1Bim4.pdf &'

################################################################################
# Functions
################################################################################

# Handy Extract Program
function extract()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via 'extract'" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

# Colored man pages
man()
{
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;37m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[47;30m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[33m") \
            man "$@"
}

################################################################################
# Variable Environments
################################################################################

export CLASSPATH=$CLASSPATH.:~/Documents/ESI/LJV/classes:~/Documents/ESI/LJV/projet:/usr/local/share/java/junit.jar:/usr/local/share/java/itextpdf.jar
export PATH=$PATH:/home/bp/scripts
export EDITOR="vim"

################################################################################
# Various
################################################################################

# Fix line wrap on window resize
shopt -s checkwinsize

# Bash history completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Auto "cd" when entering just a path
shopt -s autocd

# Erase duplicates in history
export HISTCONTROL=erasedups

# Expand history size
export HISTFILESIZE=10000
export HISTSIZE=10000

# Append to the history file when exiting instead of overwriting it
shopt -s histappend
