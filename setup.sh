#!/bin/bash


if [ $1 -eq 1 ]
then
	#move to local repo directory` \
	cd ~/Documents/git/dotfiles
	
	
	#pull latest commit from github` \
	`git pull origin master`\
	
	
	#copy .*rc files to the home directory` \
	cp .*rc ~/
	
	
	# place vim colors in runtime folder` \
	vimout=$(vim --version)
	vimLineOut=$(grep "VIMRUNTIME:" <<< "$vimout")
	touch test
	echo $vimLineOut
	echo $vimLineOut > test
	sed -i 's/.*".//' test
	sed -i 's/"//' test
	vimXXpath=$(cat test)
	rm test
	vimcolorspath=/$vimXXpath/colors
	touch test
	cp test $vimcolorspath

	# no recursive
	sed `2s/1/0/g` ~/.bashrc

	# source rc's
	source ~/.*rc

	# reset 
	sed `2s/0/1/g` ~/.bashrc
fi
