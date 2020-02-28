umask 022
autoload -U compinit promptinit colors
compinit
colors
setopt correct
#promptinit; prompt gentoo

#scratch# Oh-My-Zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"    #kardan agnoster af-magic bira clean candy gentoo terminalparty

export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color? [No, yes, abort, edit] "

#PATH=$PATH:/opt/texlive/2017/bin/x86_64-linux:$HOME/.local/lib/python3.6/site-packages

#POWERLINE_RIGHT_A="date"
#POWERLINE_RIGHT_A="exit-status"
#POWERLINE_FULL_CURRENT_PATH="true"
#POWERLINE_SHOW_GIT_ON_RIGHT="true"
POWERLINE_DATE_FORMAT="%D{%d-%m}"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_DETECT_SSH="true"
POWERLINE_GIT_CLEAN="✔"
POWERLINE_GIT_DIRTY="✘"
POWERLINE_GIT_ADDED="%F{green}✚%F{black}"
POWERLINE_GIT_MODIFIED="%F{blue}✹%F{black}"
POWERLINE_GIT_DELETED="%F{red}✖%F{black}"
POWERLINE_GIT_UNTRACKED="%F{cyan}✭%F{black}"
POWERLINE_GIT_RENAMED="➜"
POWERLINE_GIT_UNMERGED="═"
POWERLINE_RIGHT_A_COLOR_FRONT="black"
POWERLINE_RIGHT_A_COLOR_BACK="red"

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Default Programs
export EDITOR="spacemacs"
export PAGER="less"
export BROWSER="firefox"

########################################################
######################## ALIASES ####################### 
########################################################

# Clear and Screenfetch
alias clear='clear && neofetch'

# Git
alias GitStatus='git status -u no'

# Fonts
alias Fonts='fc-cache -vf ~/.fonts'
alias font-check='echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"'

# SSH
alias pu2='ssh tsteinbe@pu2.cs.ohio.edu'
alias tesla='ssh tsteinbe@tesla2.cs.ohio.edu'

## X Resources Stuff
alias eX='nvim ~/.Xresources'
alias XTR='xrdb -merge ~/.Xresources'

## i3 Stuff
alias eI='nvim ~/.config/i3/config'

## Zsh Stuff
alias eZ='emacsclient ~/.zshrc'
alias Z='source ~/.zshrc'

## Vim Stuff
alias eV='nvim ~/.config/nvim/init.vim'
alias e='nvim'

###########################################################
########################### ZSH ###########################
###########################################################
plugins=(git archlinux vi-mode themes zsh-autosuggestions zsh-syntax-highlighting history-substring-search)
source $ZSH/oh-my-zsh.sh

# enable vim mode on commmand line
bindkey -v

# show vim status
# http://zshwiki.org/home/examples/zlewidgets
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select


# Improved History Search
#autoload -U up-line-or-beginning-search
#autoload -U down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search
#bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
#bindkey "$terminfo[kcud1]" down-line-or-beginning-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# Fix home and end keys
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kdch1]}" delete-char
bindkey "${terminfo[kich1]}" overwrite-mode

# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^s' history-incremental-search-backward
bindkey -M vicmd '^s' history-incremental-search-backward

###########################################################
######################## FUNCTIONS ######################## 
###########################################################

## Commandline Fu
cmdfu() { curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" \
	| sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" ;}

##Check if websites are down
down4me() { curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g';}

## Check Internal and External IPs ##
my-ip() {
        echo "--------------- Network Information ---------------"
	# newer system like arch
	ip addr | awk '/global/ {print $1,$2}' | cut -d\/ -f1
	ip addr | awk '/global/ {print $3,$4}'
	ip addr | awk '/ether/ {print $1,$2}'
	ip addr | awk '/scope link/ {print $1,$2}' | cut -d\/ -f1
    echo Current IP $(curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+")
    echo "---------------------------------------------------"
}

##########################################################
########################## MODS ########################## 
##########################################################

# Disabled shared history
setopt no_share_history

# Fix home and end keys
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey "${terminfo[kich1]}" overwrite-mode
bindkey "${terminfo[kdch1]}" delete-char

# Blur Konsole
if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake|konsole$' ]]; then
        for wid in $(xdotool search --pid $PPID); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi
# Fix Tilix VTE Issue
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi
# OPAM configuration
. /home/kronos/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export PYTHONPATH=/usr/lib/%PYTHON%:/usr/lib/%PYTHON%/lib-dynload:/home/kronos/.local/lib/%PYTHON%/site-packages:/usr/lib/%PYTHON%/site-packages

neofetch
