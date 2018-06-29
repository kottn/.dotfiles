#==========================================
# .profile (Common)
#==========================================
#) Basic
export PATH=$HOME/bin:$PATH
export SHELL=/bin/bash
export TERM=xterm-256color
export PAGER=less
export SCREENDIR=$HOME/.screen/sockets/$HOST
export EDITOR=vim
export LESS='-iMQR -x2 -FX' # -R is must for 'git diff'


#) pyenv + Anaconda (base env)
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:${PATH}"
  eval "$(pyenv init -)"
fi
export PATH="$PYENV_ROOT/versions/anaconda3-5.1.0/bin/:$PATH"


export OMP_NUM_THREADS=4

# Roading
getos=$(${HOME}/dotfiles/scripts/getos)
[[ ${getos} == debian ]]       && source ~/.profile_debian
[[ $(uname -r) =~ Microsoft ]] && source ~/.profile_wsl
[[ -r ~/.bashrc ]]             && source ~/.bashrc

# export PATH=$HOME/local/share/ParaView/bin:$PATH
export PATH=$HOME/local/share/gmsh:$PATH
