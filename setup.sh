#!/bin/sh


#determine shell
#cp $shell configs to $home

SHELL="$( env | grep -i shell )"
SHELL="bash"
EDITOR="vim"

# editor
    cp .vimrc $HOME

# shell
	cp .bashrc ~/
    if [ ! -d ~/.config/$SHELL ]; then
       mkdir -p ~/.config/$SHELL
       cp -r shells/$SHELL/.config/* ~/.config/$SHELL/
    fi

# profile
    cp .profile ~/

# tmux
    cp .tmux.conf ~/

# scripts
    cp -r .scripts/ $HOME/.scripts

