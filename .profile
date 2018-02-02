# .profile

export TERM=xterm-256color
export PAGER=less
export SCREENDIR=$HOME/.screen/sockets/$HOST
export EDITOR=vim
export LESS='-I -R -M -W -x2'
export LESSOPEN='| src-hilite-lesspipe.sh %s'

export PATH=$HOME/bin:$HOME/local/bin:$HOME/scripts:$PATH

# pyenv for Anaconda
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

export PATH=$HOME/.gem/ruby/2.3.0/bin:$PATH
#export PATH=$HOME/bin:$HOME/scripts:$HOME/.gem/ruby/2.4.0/bin:$PATH
#export PATH=$HOME/bin/ParaView-4.4.0-Qt4-Linux-64bit/bin:$PATH
#export PATH=$HOME/bin/gmsh-2.16.0-Linux/bin:$PATH
#export PATH=$HOME/bin/gmsh-3.0.1-Linux/bin:$PATH
#export PATH=$HOME/bin/gmsh-3.0.4-Linux/bin:$PATH
#export PATH=$HOME/bin/gmsh-3.0.5-Linux/bin:$PATH
export PATH=$HOME/bin/gmsh-3.0.6-Linux64/bin:$PATH
export PATH=/usr/lib/rstudio/bin:$PATH
export PATH=$HOME/bin/Marp:$HOME/bin/gibo:$PATH


test -r ~/.bashrc && . ~/.bashrc

