# update configuration
~/Documents/git/dotfiles/setup.sh 1
# 1 means pull
# 0 mean do nothing

# Add Vim-mode in Bash
set -o vi

# .bashrc
# Source global definitions
	#if [ -f /etc/bashrc ]; then
	#. /etc/bashrc
	#fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
	alias gtw='cd ~/Documents/Git/usf_rc_tfawcett/waltonlab/code/fra'
	alias u='cd ..'
	alias v='vim'
	alias s='ls -al'
	alias sl='s | less'
	alias g='grep'
	alias c='clear'

	# ssh
		alias sshjc='ssh jdearmas@circe.rc.usf.edu'
	
	# sys admin alias
		alias ds='du -sh ./'
		alias dsa='du -h --max-depth=1'
		alias sqj='squeue -o"%.7i %.9P %.8j %.8u %.2t %.10M %.6D %C" | grep -i jdearmas | less'
	
	# git alias
		alias gl='git log --graph --oneline --decorate --all'
		alias gs='git status'
		alias gaa='git add .'
		alias gc='git commit'
		alias gplom='git pull origin master' 
		alias gpsom='git push origin master'
	
	# directory movement
		alias cdd='cd ~/Documents/'
		alias cddw='cd ~/Downloads/'
		alias cdg='cd ~/Documents/git'
		alias cdgd='cd ~/Documents/git/dotfiles'

	# Computer-dependent
			alias cdnb='cd ~/Documents/git/usf_rc_tfawcett/nsf_crn/bash/serial'
			alias cdrep='cd /rcfs/workprojects/waltonlab/ephys'


	# directory movement mk. 2
		alias gtd='function _gtd(){ dp="$1"; fdp=$(find . -iname $dp -type d); cd $fdp; };_gtd'
		alias f='find . -iname'

# The various escape codes that we can use to color our prompt.
        RED="\[\033[0;31m\]"
     #YELLOW="\[\033[33m\]"
     YELLOW="\[\033[38;5;221m\]"
      GREEN="\[\033[0;32m\]"
       BLUE="\[\033[38;5;27m\]"
  LIGHT_RED="\[\033[1;31m\]"
LIGHT_BOLD_CYAN="\[\033[38;5;51m\]"
LIGHT_GREEN="\[\033[38;5;208m\]"
#LIGHT_BLUE="\[\033[0;34m\]"
#LIGHT_CYAN="\[\033[0;36m\]"
#LIGHT_GREEN="\[\033[1;32m\]"
      WHITE="\[\033[1;37m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 COLOR_NONE="\[\e[0m\]"

 # Detect whether the current directory is a git repository.
 function is_git_repository {
   git branch > /dev/null 2>&1
 }


 function set_git_branch {
   # Set the final branch string
   BRANCH=`parse_git_branch`
   local TIME=`fmt_time` # format time for prompt string
 }


 function parse_git_branch() {
   git branch --no-color 2> /dev/null           \
					 | sed -e '/^[^*]/d'                  \
					 -e 's/* /*/'                         \
					 -e "s/* \(.*\)/\1$(parse_git_dirty)/"
 }


 function parse_git_dirty() {
   [[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
 }


 fmt_time () { #format time just the way I likes it
     if [ `date +%p` = "PM" ]; then
         meridiem="pm"
     else
         meridiem="am"
     fi
     date +"%l:%M:%S$meridiem"|sed 's/ //g'
 }


 # Return the prompt symbol to use, colorized based 
 # on the return value of the previous command.
 function set_prompt_symbol () {
   if test $1 -eq 0 ; then
       PROMPT_SYMBOL="\$"
   else
       PROMPT_SYMBOL="${LIGHT_RED}\$${COLOR_NONE}"
   fi
 }


 # Determine active Python virtualenv details.
 function set_virtualenv () {
   if test -z "$VIRTUAL_ENV" ; then
       PYTHON_VIRTUALENV=""
   else
       PYTHON_VIRTUALENV="${YELLOW}(`basename \"$VIRTUAL_ENV\"`)${COLOR_NONE}"
   fi
 }


 # Set the full bash prompt.
 function set_bash_prompt () {
   # Set the PROMPT_SYMBOL variable. 
	 # We do this first so we don't lose the
   # return value of the last command.
   set_prompt_symbol $?

   # Set the PYTHON_VIRTUALENV variable.
   set_virtualenv

   # Set the BRANCH variable.
   if is_git_repository ; then
     set_git_branch
		 BRANCH={$BRANCH}
   else
     BRANCH=''
   fi

	GIT="${LIGHT_GREEN}${BRANCH}"
	 PY="${COLOR_NONE}${PYTHON_VIRTUALENV}"
	 PS=" ${BLUE}${PROMPT_SYMBOL}${COLOR_NONE} "
	 INDICTORS="\n${GIT}${PY}${PS}"
   # Set the bash prompt variable.
	 PS1="\n${BLUE}\u${RED}@${LIGHT_BOLD_CYAN}\h:${RED}\w${INDICTORS}"

 }


 # Tell bash to execute this function just before displaying its prompt.
 PROMPT_COMMAND=set_bash_prompt

# Man pages on Git bash
function man {
    local section=all
    if [[ "$1" =~ ^[0-9]+$ ]]; then section="$1"; shift; fi
    local doc="$(curl -v --silent --data-urlencode topic="$@" --data-urlencode section="$section" http://man.he.net/ 2>&1)"
    local ok=$?
    local pre="$(printf '%s' "$doc" | sed -ne "/<PRE>/,/<\/PRE>/ { /<PRE>/ { n; b; }; p }")"
    [[ $ok -eq 0 && -n "$pre" ]] && printf '%s' "$pre" | less || printf 'Got nothing.\n' >&2
    return $ok
}

