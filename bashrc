# Tunned .bashrc with lots of aliases.
# The idea is to have a .bashrc that works in OSX as well as in Linux.
# NOTE: OSX machines use .bash_profile instead of .bashrc, add the following
# to .bash_profile to tell OSX to use .bashrc:

# Use .bashrc file
# if [ -f ~/.bashrc ]; then
#   source ~/.bashrc
# fi


#-------------------------------------------
#
#  GENERAL SHELL STUFF
#
#------------------------------------------
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


#Make sure ls is colourized, on OSX and other machines also.
if [ "$TERM" != "dumb" ]; then
    if [ `uname` == "Darwin" ]; then
       alias ls='ls -G'
    else
       eval "`dircolors -b`"
       alias ls='ls --color=auto'
    fi
fi


#------------------------------------------
# PROMPT
# Different prompt if on a local or remote machine
#useful resources:
# https://scriptim.github.io/bash-prompt-generator/
# http://bashrcgenerator.com/
#------------------------------------------
function __setprompt {
  
  local SSH_IP=`echo $SSH_CLIENT | awk '{ print $1 }'`
  local SSH2_IP=`echo $SSH2_CLIENT | awk '{ print $1 }'`
  if [[ $SSH2_IP != $SSH_IP ]] ; then

        export PS1='\[\e[0m\][\[\e[0;38;5;130m\]\u\[\e[0;38;5;142m\]@\[\e[0;38;5;130m\]$(ip route get 1.1.1.1 | awk -F"src " '"'"'NR==1{split($2,a," ");print a[1]}'"'"')\[\e[0m\]]\[\e[0m\]:\[\e[0;38;5;130m\]\w\[\e[0;38;5;130m\]$ \[\e[0m\]'
  else
  
    export PS1="\e[0;34m[\u:\w]\$ \e[m "
  
  fi

}

__setprompt


#-------------------------------------------
#       LESS RELATED STUFF
#------------------------------------------

#Let's see man pages in a better way
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#-------------------------------------------
#
#  ALIAS SECTION
#
#------------------------------------------
alias diskusg='du -s ./* | sort -n'
alias up1='cd ..'
alias up2='cd ../..'
alias up3='cd ../../..'
alias up4='cd ../../../..'
alias gt233='ssh -l apinzon 168.176.61.233'
alias gt231='ssh -l apinzon 168.176.61.231'
alias gt232='ssh -l apinzon 168.176.61.232'
alias gt234='ssh -l apinzon 168.176.61.234'
alias gt250='ssh -l gibbs 168.176.61.250'
alias c='clear'
alias ffile='find ./ -type f -name '
alias watchfiles='while : ;do ls -l;sleep 2;done'
alias GT='echo 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'
alias vpnunal='sudo openconnect -u ampinzonv 168.176.241.70'
#------------------------------------------
#
#  HISTORY
#
#------------------------------------------
# Combine multiline commands into one in history
shopt -s cmdhist
# append to the history file, don't overwrite it
# https://serverfault.com/questions/3743/what-useful-things-can-one-add-to-ones-bashrc?page=1&tab=votes#tab-top
#Basicamente un shell tiene la historia de otro shell tambien.
shopt -s histappend
PROMPT_COMMAND='history -a'

# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE=ls:cd:pwd:exit:su:df:clear:cls

export HISTFILESIZE=20000
export HISTSIZE=10000


#-------------------------------------------
#
#  EXPORTS SECTION
#
#------------------------------------------
export EDITOR=vim
#Color all grep searches

bind "set show-all-if-ambiguous On" # show list automatically, without double tab


#-------------------------------------------
#
#  FUNCTIONS
#
#------------------------------------------
#Pretty display of CSV files (https://www.stefaanlippens.net/pretty-csv.html)
function csv2tbl(){
	cat $1 | sed 's/,/ ,/g' | column -t -s, | less -S
}


#Uncompress several type of files
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
       echo "Extracting $1"
   else
       echo "'$1' is not a valid file!"
   fi
 }

#Make quick file backups
bufile () { cp $1 ./`basename $1`-`date +%Y%m%d%H%M`.backup ; }


#
# This section was automatically added to your .bashrc file by the
# BIOBASH installer on: 12-02-2021.
# A copy of your original .bashrc file was created with name: .bashrc_12-02-2021

# DO NOT modify below unless you are completely sure what you are doing
# otherwise BIOBASH may not function at all.
#

BIOBASH_HOME=./
BIOBASH_LIB=lib 
BIOBASH_BIN=bin
SHML_LIB=lib/shml/shml.sh
BASHUTILITY_LIB_PATH=lib/bash-utility
BASHUTILITY_LIB=lib/bash-utility/bash_utility.sh
BASHUTILITY_LIB=lib/bash-utility/bash_utility.sh
BB_NATIVE_LIB_PATH=lib/bb_native
BB_NATIVE_LIB=lib/bb_native/bb_native.sh



export BIOBASH_HOME
export BIOBASH_LIB 
export BIOBASH_BIN 
export SHML_LIB
export BASHUTILITY_LIB_PATH
export BASHUTILITY_LIB
export BB_NATIVE_LIB_PATH
export BB_NATIVE_LIB



