#!/bin/sh


#determine shell
#cp $shell configs to $home


SHELL="bash"
EDITOR="vim"

# editor
    cp .vimrc ~/

# shell
    if [ ! -d ~/.config/$SHELL ]
       mkdir ~/.config/$SHELL
       cp -r shells/$SHELL/.config/ ~/.config/$SHELL/

