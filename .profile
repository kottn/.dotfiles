# .profile

test -r ~/.bashrc && . ~/.bashrc

export TERM=xterm-256color
export PAGER=less
export SCREENDIR=$HOME/.screen/sockets/$HOST
export EDITOR=vim
export LESS='-I -R -M -W -x2 -F -X'
export LESSOPEN='| src-hilite-lesspipe.sh %s'

export PATH=$HOME/bin:$PATH
export PATH=$HOME/local/bin:$PATH

# pyenv for Anaconda
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

export PATH=$HOME/.gem/ruby/2.3.0/bin:$PATH
export PATH=/usr/lib/rstudio/bin:$PATH

#export PATH=$HOME/share/ParaView-4.4.0-Qt4-Linux-64bit/bin:$PATH
#export PATH=$HOME/share/gmsh-2.16.0-Linux/bin:$PATH
#export PATH=$HOME/share/gmsh-3.0.1-Linux/bin:$PATH
#export PATH=$HOME/share/gmsh-3.0.4-Linux/bin:$PATH
#export PATH=$HOME/share/gmsh-3.0.5-Linux/bin:$PATH
export PATH=$HOME/share/gmsh-3.0.6-Linux64/bin:$PATH
export PATH=$HOME/share/Marp:$PATH
export PATH=$HOME/share/gibo:$PATH

export GOROOT=$HOME/share/go
export PATH=$GOROOT/bin:$PATH
export GOPATH=$HOME/go
