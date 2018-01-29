#==========================================
# Kotani's .bashrc
#==========================================
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

#--------------- Common -------------------

export PATH=$PATH:~/bin
export PATH=$PATH:/usr/lib/rstudio/bin
#export PATH=$PATH:~/bin/ParaView-4.4.0-Qt4-Linux-64bit/bin
#export PATH=$PATH:~/bin/gmsh-2.16.0-Linux/bin
#export PATH=$PATH:~/bin/gmsh-3.0.1-Linux/bin
#export PATH=$PATH:~/bin/gmsh-3.0.4-Linux/bin
#export PATH=$PATH:~/bin/gmsh-3.0.5-Linux/bin
export PATH=$PATH:~/bin/gmsh-3.0.6-Linux64/bin

# gibo
export PATH=$PATH:~/bin/gibo

# pyenv + Anaconda
# export PYENV_ROOT="$HOME/.pyenv"
# if [ -d "${PYENV_ROOT}" ]; then
#   export PATH="$PYENV_ROOT/bin:$PATH"
#   eval "$(pyenv init -)"
# fi


if [ -e /usr/share/terminfo/x/xterm-256color ]; then
      export TERM=xterm-256color
else
      export TERM=xterm-color
fi

# gem
export PATH=$PATH:~/.gem/ruby/2.3.0/bin
# Marp
export PATH=$PATH:~/bin/Marp

# -- Alias
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
#alias grep='grep -iIT --color=auto'
if [ -f ~/.cdhist.sh ]; then
    . ~/.cdhist.sh
fi
alias ..='cd ../ && ls'
alias .2='cd ../../ && ls'
alias .3='cd ../../../ && ls'
alias .4='cd ../../../../ && ls'


# -- History&Shopt
HISTCONTROL=ignoreboth      # 重複履歴＆空白から始めたコマンドを保存しない
HISTIGNORE="fg*:bg*:history*:ls::lf:la:ll:lt"   #履歴に保存しないコマンド
HISTTIMEFORMAT='%m/%d %T '  # historyにタイムスタンプを記録
shopt -s histreedit         # 履歴の展開に失敗したらバッファに内容を残す
shopt -s histverify         # 履歴文字列を即座に実行せず一度展開
shopt -s histappend         # .bash_historyに上書きではなく追記する
HISTSIZE=10000              # 履歴のMAX保存数を指定
HISTFILESIZE=20000          # ~/.bash_history に記録する履歴数
function sync_history {   # 異なるbashでコマンド履歴を共有する関数
  history -a    # .bash_historyに前回コマンドを1行追記
  history -c    # 端末ローカルの履歴を一旦消去
  history -r    # .bash_historyから履歴を読み込み直す
}
PROMPT_COMMAND='sync_history'   #上記関数をプロンプト毎に自動実施
shopt -s checkwinsize   # プロンプトの表示をwindow-sizeに最適化
shopt -s extglob        # 強力なワイルドカードの表現が使える


# -- bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# -- git completion
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi
if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto


# -- Function 'ss'
mydef_screen () {
  name=${1:-${PWD##*/}}
  screen -D -R $name
}
alias ss='mydef_screen'

# -- Function 'lgmi'
mydef_logmiru () {
  logfile=`ls -lt *.log | awk 'NR==1' | awk '{print $NF}'`
	less $logfile
}
alias lgmi='mydef_logmiru'

#--------------- Unique -------------------
case "$HOSTNAME" in
  pippen | james )
      eval `dircolors ~/.colorrc`
      eval `xset b off`
      case $- in
        *i*) ;;
          *) return;;
      esac
      alias filer='thunar'

      #-- For tools
      mydef_runR () {
        R --vanilla < ${1} > ${1}.log
        less ${1}.log
      }
      alias rr='mydef_runR'
      alias mu='mupdf ./*.pdf'


      #-- Prompt design
      # 0;30m -> Black  | 0;34m -> Blue
      # 0;31m -> Red    | 0;35m -> Purple
      # 0;32m -> Green  | 0;36m -> Cyan
      # 0;33m -> Yellow | 0;37m -> White
      #-------------------------------------
      if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
      fi

      PS1="\[\033[32m\]\t\[\033[m\][\u@\[\033[0;37m\]\h:\[\033[m\]\w\[\033[m\]]\$(__git_ps1)\n\$ "
      PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"

      export OMP_NUM_THREADS=4
;;



  * )

      eval `dircolors ~/.colorrc`
      alias ee='less *.e[0-9]*'
      alias oo='less *.o[0-9]*'
;;
esac


