# .profile
test -r ~/.bashrc && . ~/.bashrc
export LANG=ja_JP.utf-8
export TERM=xterm-256color
export PAGER=less
export SCREENDIR=$HOME/.screen/sockets/$HOST
export EDITOR=vim
export LESS='-iMQ -x2 -FX'

export PATH=$HOME/bin:$PATH
export PATH=$HOME/local/bin:$PATH

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi
# for pyenv + Anaconda(base env)
export PATH="$PYENV_ROOT/versions/anaconda3-5.1.0/bin/:$PATH"


# rbenv
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

# rstudio
export PATH=/usr/lib/rstudio/bin:$PATH

#export PATH=$HOME/share/ParaView-4.4.0-Qt4-Linux-64bit/bin:$PATH

#export PATH=$HOME/share/gmsh-2.16.0-Linux/bin:$PATH
export PATH=$HOME/share/gmsh-3.0.6-Linux64/bin:$PATH

export PATH=$HOME/share/Marp:$PATH
export PATH=$HOME/share/gibo:$PATH
export PATH=$HOME/share/Shiba-linux-x64:$PATH
export PATH=$HOME/share/Marp:$PATH

# golang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.go
export PATH=$GOPATH/bin:$PATH

[ $HOSTNAME == "rodman" ] && source ~/.bashrc_wsl
[ $HOSTNAME == "lebron" ] && source ~/.bashrc_wsl

