#!/bin/bash
thisdir=$(cd $(dirname $0) && pwd)
cd $thisdir

echo " Now downloading..."
# -- git-completion
rURL=https://raw.githubusercontent.com/git/git/master/contrib/completion
curl -L ${rURL}/git-completion.bash > .git-completion.bash
curl -L ${rURL}/git-prompt.sh > .git-prompt.sh
# -- cdhist
curl -L http://www.unixuser.org/~euske/doc/bashtips/cdhist.sh > .cdhist.sh


echo " Now linking..."
mkdir -p .vim/backup
mkdir -p .vim/viminfo
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue
    ln -snfv ${thisdir}/"$f" ~/
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

