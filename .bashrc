# Add Vim-mode in Bash
    set -o vi

# Allows you to cd into directory merely by typing the directory name
    shopt -s autocd

# Infinite history
    HISTSIZE= HISTFILESIZE=

# Allow Aliases To Work from 'st' ssh to 'xterm'
    export TERM=xterm

# load colors
    [ -f "$HOME/.config/prompt" ] && \
        source "$HOME/.config/bash/colors"

# load prompt
    [ -f "$HOME/.config/prompt" ] && \
        source "$HOME/.config/bash/prompt"

# load directory shortcuts
    [ -f "$HOME/.config/shortcutrc" ] && \
        source "$HOME/.config/bash/shortcutrc"

# load aliases
    [ -f "$HOME/.config/aliasrc" ] && \
        source "$HOME/.config/bash/aliasrc"


# Color Man Pages
    # Get color support for 'less'
    export LESS="-iXR --RAW-CONTROL-CHARS"

    # Use colors for less, man, etc.
    [[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

# Fuzzy Finder Config File
		[ -f ~/.fzf.bash ] && source ~/.fzf.bash
