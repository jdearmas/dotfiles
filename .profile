#!/bin/bash
# Profile file. Runs on login.


export USERBIN="$HOME/bin"

# Adds `$USERBIN` and all subdirectories to $PATH
export PATH="$PATH:$(du "$USERBIN" | cut -f2 | tr '\n' ':')"
export PATH="$PATH:$(du "$HOME/go/bin" | cut -f2 | tr '\n' ':')"
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="qutebrowser"
export READER="zathura"
export FILE="ranger"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export REFER="$HOME/.referbib"
export SUDO_ASKPASS="$USERBIN/tools/dmenupass"
export PIX="$HOME/.pix/"
export PRINTER="hp_wireless" # cups queue-name
export REMINDERS="$HOME/vimwiki/5-min.wiki" # quick reminders
export SHOP="$HOME/vimwiki/shop.wiki"
export ALIAS="$HOME/.config/aliasrc"
export TMP="$HOME/docs/personal/tmp"
export RESUME="$HOME/docs/work/resume/code/resume"
export CALCURSE_CALDAV_PASSWORD=""
export FLASK_ENV="development"
export DESKTOP="192.168.0.6"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

[ ! -f ~/.shortcuts ] && shortcuts >/dev/null 2>&1

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Switch escape and caps if tty:
sudo -n loadkeys $USERBIN/ttymaps.kmap 2>/dev/null

export LESS="-iXR --RAW-CONTROL-CHARS"
