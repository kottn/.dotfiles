#!/bin/bash

if type "git" > /dev/null 2>&1; then
    echo "Type in your name (or github account name - e.g. 'tkotani1'):"
    read fullname
    echo "Type in your email (e.g. '35750723+tkotani1@users.noreply.github.com'):"
    read email

    git config --global user.name $fullname
    git config --global user.email $email
    git config --global core.editor 'vim -c "set fenc=utf-8"'
    git config --global color.diff auto
    git config --global color.status auto
    git config --global color.branch auto

else

    echo " [WARNING] 'git' command not found"
    echo " Run me again as follows:"
    echo " $ sudo apt install git && sh install.sh"
    exit 1

fi

