# dotfiles ⊙
dotfiles is a repo that contains my most updated configuration files.

In addition, it places them in the home directory.

<p align="center">
  <img src="https://github.com/jdearmas/dotfiles/blob/master/doc/preview3.png" width="750" height="137">
  <img src="https://github.com/jdearmas/dotfiles/blob/master/doc/preview2.PNG" width="750" height="450">

# Table of Contents
[Warning](##Warning)
[Usage](##Usage)
[Installation](##Installation)
[--Prep](###Prep)
[--Run](###Run)


## Usage
This repo contains configurations files ( .bashrc, .vimrc, .mintty, etc ).
These config files are used to format programs.

The executable bash script ``` setup.sh ``` automatically:
1. pulls from the github repo
2. places configuration files in the home directory
3. repeats 1-2 every time the terminal is launched

## Installation
### Prep
```
mkdir ~/Documents/git/
cd ~/Documents/git
git clone https://github.com/jdearmas/dotfiles.git
```

### Run
```
cd ~/Documents/git/dotfiles
./setup.sh 1
```
