#!/bin/bash

if type "git" > /dev/null 2>&1; then

    git config --global user.name "tkotani1"
    git config --global user.email "35750723+tkotani1@users.noreply.github.com"
    git config --global core.editor 'vim -c "set fenc=utf-8"'
    git config --global color.diff auto
    git config --global color.status auto
    git config --global color.branch auto

else

    echo " [WARNING] 'git' command not found"
    echo " Retry using $ sudo apt install git && sh install.sh"
    exit 1

fi
