#==========================================
# .bashrc (Common)
#==========================================
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

[ $HOSTNAME == "rodman"   ] && HOST_COLOR="green"
[ $HOSTNAME == "lebron"   ] && HOST_COLOR="green"
[ $HOSTNAME == "pippen"   ] && HOST_COLOR="blue"
[ $HOSTNAME == "eggplant" ] && HOST_COLOR="yellow"
[ $HOSTNAME == "pea"      ] && HOST_COLOR="cyan"
[ $HOSTNAME == "kimchi"   ] && HOST_COLOR="red"
HOST_COLOR=${HOST_COLOR:-white}
case "$HOST_COLOR" in
   black*) col=30;;   red*) col=31;;  green*) col=32;;
  yellow*) col=33;;  blue*) col=34;;   pink*) col=35;;
    cyan*) col=36;;  gray*) col=37;;       *) col=39;;
esac

eval $(dircolors ~/.colorrc)

[[ -r ~/.git-completion.bash ]] && source ~/.git-completion.bash
[[ -r ~/.git-prompt.sh       ]] && source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

PS1="\t $HOSTNAME\[\e[${col}m\]\w\$(__git_ps1)\n\$\[\e[m\] "
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac

function ss { name=${1:-${PWD##*/}} && screen -D -R $name; }
function rr { R --vanilla < ${1} > ${1}.log; less ${1}.log; }
function ff { if [ ! "$1" ]; then echo 'usage: ff pattern [dir ...]'; \
                        else n="*$1*"; shift; find . "$@" -name "$n"; fi }
function ee { less  `ls -t ./stderr/*.e[0-9]* | head -n 1`; }
function oo { less  `ls -t ./stdout/*.o[0-9]* | head -n 1`; }
function gm { for pr in "$@"; do \mv -v --backup=numbered ${pr} ~/_gm; done }

alias sc='source ~/.bashrc'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias ln='ln -i'
alias qq='exit'
alias ssh='ssh -Y'
alias vi='vim'
alias ls='ls -FX --color=auto --show-control-chars'
alias la='ls -a'
alias ll='ls -lh'
alias lt='ls -lth'
alias grep='grep -iI --color=auto'
alias jn='jupyter notebook --ip=0.0.0.0 --port=8080'

# Roading
getos=$(${HOME}/dotfiles/scripts/getos)
[[ ${getos} == debian ]]       && source ~/.bashrc_debian
[[ $(uname -r) =~ Microsoft ]] && source ~/.bashrc_wsl

