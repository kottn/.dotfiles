#!/bin/bash
rundir=$(cd $(dirname $0) && pwd)
cd $rundir

echo " Now downloading..."
# -- git-completion
rURL=https://raw.githubusercontent.com
curl -L ${rURL}/git/git/master/contrib/completion/git-completion.bash > .git-completion.bash
curl -L ${rURL}/git/git/master/contrib/completion/git-prompt.sh > .git-prompt.sh
# -- cdhist
curl -L http://www.unixuser.org/~euske/doc/bashtips/cdhist.sh > .cdhist.sh


echo " Now linking..."
mkdir -p .vim/backup
mkdir -p .vim/viminfo
for f in .??*; do
    [ "$f" = ".git" ] && continue
    ln -snfv ${rundir}/"$f" ~/
done


echo " Run 'autoconf/*'? (y|n):"
read ans
if [ $ans == "y" ]; then
    echo " -- Now installing..."
    . ./autoconf/apt_install.sh
    . ./autoconf/git_config.sh
    . ./autoconf/git_clone.sh
fi


echo " Done!"

