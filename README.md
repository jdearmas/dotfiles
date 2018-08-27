# dotfiles
dotfiles is a repo that contains my most updated configuration files. In addition, it places them in the home directory. Lastly, the repo sets up a recursive update.

# Table of Contents
[Warning](##Warning)  
[Usage](##Usage)
[Installation](##Installation)  
[--Prep](###Prep)
[--Run](###Run)

    

## Warning 
Once properly install, this repo will automatically pull from github repo 

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
