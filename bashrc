#==========================================
# Kotani's .bashrc
#==========================================
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HOST_COLOR=${HOST_COLOR:-blue}
case "$HOST_COLOR" in
   black*) col=30;;   red*) col=31;; green*) col=32;;
  yellow*) col=33;;  blue*) col=34;;  pink*) col=35;;
    cyan*) col=36;; white*) col=37;;      *) col=1;;
esac

test -r ~/.git-completion.bash && source ~/.git-completion.bash
test -r ~/.git-prompt.sh       && source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
complete -d cd
complete -c man

test -r ~/.cdhist.sh && source ~/.cdhist.sh
HISTCONTROL=ignoreboth
HISTIGNORE="fg*:bg*:history*:ls::lf:la:ll:lt"
HISTTIMEFORMAT='%m/%d %T '
shopt -s histreedit
shopt -s histverify
shopt -s histappend
IGNOREEOF=10
HISTSIZE=1000
function sync_history {
    history -a    # .bash_historyに前回コマンドを1行追記
    history -c    # 端末ローカルの履歴を一旦消去
    history -r    # .bash_historyから履歴を読み込み直す
}
PROMPT_COMMAND='sync_history'
shopt -s checkwinsize
shopt -s extglob

eval `dircolors ~/.colorrc`

case "$HOSTNAME" in
    # Debian / Ubuntu
    pippen | james | rodman )
        eval `xset b off`

        if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
          debian_chroot=$(cat /etc/debian_chroot)
        fi
        PS1="\t $HOSTNAME\[\e[${col}m\]\w\$(__git_ps1)\n\$\[\e[m\] "
        case "$TERM" in
        xterm*|rxvt*)
            PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
            ;;
        *)
            ;;
        esac

        alias dm='tw -dm'
        function gggterra { tw --dm:to=gggterra "${1}"; }
        function eddyrhcp { tw --dm:to=eddyrhcp "${1}"; }

;;
    # Other
    * )
        PS1="\t $HOSTNAME\[\e[${col}m\]\w\$(__git_ps1)\n\$\[\e[m\] "
        case "$TERM" in
        xterm*|rxvt*)
            PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
            ;;
        *)
            ;;
        esac
;;
esac

function ss { name=${1:-${PWD##*/}} && screen -D -R $name; }
function rr { R --vanilla < ${1} > ${1}.log; less ${1}.log; }
function ff { if [ ! "$1" ]; then echo 'usage: f pattern [dir ...]'; \
                        else n="*$1*"; shift; find . "$@" -name "$n"; fi }
function ee { less  `ls -t ./stderr/*.e[0-9]* | head -n 1`; }
function oo { less  `ls -t ./stdout/*.o[0-9]* | head -n 1`; }
function mu { mupdf `ls -t *.pdf | head -n 1`; }


alias sc='source ~/.bashrc'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'
alias ln='ln -i'
alias qq='exit'
alias ssh='ssh -Y'
alias vi='vim'
alias ls='LC_ALL=C ls -FX --color=auto --show-control-chars'
alias la='ls -a'
alias ll='ls -lh'
alias lt='ls -lth'
alias grep='grep -iI --color=auto'
alias ..='cd ../ && ls'
alias .2='cd ../../ && ls'
alias .3='cd ../../../ && ls'
alias .4='cd ../../../../ && ls'
alias tree='tree --charset=C -FN'

export OMP_NUM_THREADS=4

