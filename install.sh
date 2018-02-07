#!/bin/bash
this_dir=$(cd $(dirname $0) && pwd)
cd $this_dir

mkdir -p .vim/backup
mkdir -p .vim/viminfo

rURL=https://raw.githubusercontent.com

echo ""
echo " --- Now downloading..."
# -- git-completion
curl -L ${rURL}/git/git/master/contrib/completion/git-completion.bash > .git-completion.bash
curl -L ${rURL}/git/git/master/contrib/completion/git-prompt.sh > .git-prompt.sh
# -- cdhist
curl -L ${rURL}/euske/settings/master/bash/cdhist.sh > .cdhist.sh
# -- vim-plug
mkdir -p .vim/autoload
curl -L ${rURL}/junegunn/vim-plug/master/plug.vim > .vim/autoload/plug.vim

echo ""
echo " --- Now linking..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue
    ln -snfv ${this_dir}/"$f" ~/
done


echo ""
echo " Run 'autoconf/*.sh'? (y|n):"
read ans
if [ $ans == "y" ]; then
    echo " --- Now installing..."
    . ./autoconf/apt_install.sh
    . ./autoconf/git_config.sh
    . ./autoconf/git_clone.sh
fi

echo " Done!"
