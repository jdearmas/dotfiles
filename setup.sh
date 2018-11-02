#!/bin/bash

function cd_copy_and_replace(){
	#move to local repo directory
	#copy .*rc files to the home directory
	#pull latest commit from github

	cd ~/Documents/git/dotfiles
	git pull origin master
	cp .*rc ~/ ;}

function place_vim_colors(){
    vimout=$(vim --version)
    vimLineOut=$(grep "VIMRUNTIME:" <<< "$vimout")
    touch test
    echo $vimLineOut > test
    sed -i 's/.*".//' test
    sed -i 's/"//' test
    vimXXpath=$(cat test)
    rm test
    vimcolorspath=/$vimXXpath/colors
    touch test
    cp vim/space.vim $vimcolorspath ;}

if [ $1 -eq 1 ]
then

    cd_copy_and_replace

	# place vim colors in runtime folder
    place_vim_colors

    # no recursive
    sed -i '2s/1/0/g' ~/.bashrc

    # source rc's
    source ~/.*rc

    # reset
    sed -i '2s/0/1/g' ~/.bashrc
fi

if [ $1 -eq 2 ]
then
	#move to local repo directory
	#pull latest commit from github
	#copy .*rc files to the home directory
    cd_copy_and_replace

	# place vim colors in runtime folder
    place_vim_colors

    # no recursive
    sed -i '2s/1/0/g' ~/.bashrc
    sed -i '2s/2/0/g' ~/.bashrc

    # source rc's
    source ~/.*rc
fi
