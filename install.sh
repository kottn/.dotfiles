#!/bin/bash

echo " -- Favorite tools downloading..."
# -- git-completion
rURL=https://raw.githubusercontent.com
curl ${rURL}/git/git/master/contrib/completion/git-completion.bash > .git-completion.bash
curl ${rURL}/git/git/master/contrib/completion/git-prompt.sh > .git-prompt.sh

# -- cdhist
curl http://www.unixuser.org/~euske/doc/bashtips/cdhist.sh > .cdhist.sh

echo " -- Now linking..."
THIS_DIR=`pwd`
for f in .??*; do
    [ "$f" = ".git" ] && continue
    ln -snfv ${THIS_DIR}/"$f" ~/
done

echo " -- Run 'autoconf/*'? (y|n):"
read ans
if [ $ans == "y" ]; then
    echo " -- Now autoconf booting..."
    . ./autoconf/apt_install.sh
    . ./autoconf/git_config.sh
    . ./autoconf/git_clone.sh
fi

echo " -- Done!"

