#!/bin/bash

THIS_DIR=`pwd`

echo " - now git-completion files downloading..."
rURL=https://raw.githubusercontent.com
curl ${rURL}/git/git/master/contrib/completion/git-completion.bash > .git-completion.bash
curl ${rURL}/git/git/master/contrib/completion/git-prompt.sh > .git-prompt.sh

echo " - now linking..."
for f in .??*; do
    [ "$f" = ".git" ] && continue
    ln -snfv ${THIS_DIR}/"$f" ~/
done

echo " - install & configure"
sh autoconf/apt_install.sh
sh autoconf/git_config.sh
sh autoconf/git_clone.sh

echo " - done!"
