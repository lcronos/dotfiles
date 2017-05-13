autoload -U compinit promptinit
compinit
promptinit; prompt gentoo

#scratch# Oh-My-Zsh
ZSH=/home/kronos/.oh-my-zsh
ZSH_THEME="bira"    #kardan agnoster af-magic bira clean candy gentoo terminalparty

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

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Default Programs
#export NMON=cmknt
export EDITOR="vim"
export PAGER="less"
export BROWSER="qutebrowser"
export MOVPLAY="mpv"
export PICVIEW="feh"
export SNDPLAY="mpv"
#export TERMINAL="uxterm"
export PULSE_LATENCY_MSEC=60
#export TERM="xterm-256color"
export TERM="rxvt-unicode-256color"

# File Extensions
for ext in html org php com net no;    do alias -s $ext=$BROWSER; done
for ext in txt tex py PKGBUID;        do alias -s $ext=$EDITOR; done
for ext in png jpg gif;            do alias -s $ext=$PICVIEW; done
for ext in mpg wmv avi mkv;        do alias -s $ext=$MOVPLAY; done
for ext in wav mp3 ogg;            do alias -s $ext=$SNDPLAY; done

########################################################
######################## ALIASES ####################### 
########################################################

# Git
alias cdG='cd ~/Git/dotfiles'
alias GitStatus='git status -u no'
alias GitCommit='git commit -m'

# Fonts
alias Fonts='fc-cache -vf ~/.fonts'
alias font-check='echo "\ue0b0 \u00b1 \ue0a0 \u27a6 \u2718 \u26a1 \u2699"'

# Backupp
alias Backup-local='sudo /home/kronos/Scripts/laptop_backup_local.sh'

# SSH
alias tesla='ssh tsteinbe@tesla2.cs.ohio.edu'
alias tesla-X='ssh -X tsteinbe@tesla2.cs.ohio.edu'
alias L-get='echo "/path/to/host/file ~/path/to/destination" && scp tsteinbe@tesla2.cs.ohio.edu'

## Games
alias mario='mupen64plus --windowed ~/ROMs/N64/SuperMario64.v64'
alias kart='mupen64plus --windowed ~/ROMs/N64/MarioKart64.v64'
alias ps2='pcsx2'

## Packages
alias extract='tar xaf'
alias gz='tar xzf'
alias xz='tar xJf'
alias bz='tar xvjf'
alias bz2='tar jxvf'

## Gentoo
#alias find-config='find /etc -iname '._cfg????_*''
alias HowLong='genlop -t'
alias OneShot='emerge --oneshot portage'
alias Rebuild='revdep-rebuild -v -- --ask --keep-going'
#alias sync='time emerge --sync'
alias S='emerge -s'
alias I='time emerge -av'
alias Uworld='time emerge --ask --verbose --update --newuse --deep @world'
alias Uworld-bdeps='time emerge --ask --newuse --update --deep --with-bdeps=y @world'
alias Esync='eix-sync'
alias Eupdate='eix --update'
alias cdP='cd /etc/portage && sudo su'
alias cdU='cd /etc/portage/package.use && sudo su'
alias cdK='cd /etc/portage/package.keywords && sudo su'
alias eM='sudo vim /etc/portage/make.conf'
 
## Portage
alias F='tail -f /var/log/emerge-fetch.log'
alias E='tail -f /var/log/emerge.log'
alias G='watch genlop -unc'

## Theming
alias Default='~/Scripts/Theming/default.sh'

## Directories
alias ll='ls -l'
alias la='ls -lsa'
alias l='ls'
alias C='clear'
alias se='sudo nvim'
alias e='nvim'
alias home='cd ~'
alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias .....='cd .....'
alias k='exit'
alias te='trash-empty'
alias tl='trash-list'
alias del='trash-put'
alias tr='trash-rm'
alias lsTrash='ls ~/.local/share/Trash/files/'
alias cdTrash='cd ~/.local/share/Trash/files/'
alias lD='ls ~/Downloads'
alias D='cd ~/Downloads'

## X Resources Stuff
alias eX='nvim ~/.Xresources'
alias XTR='xrdb -merge ~/.Xresources'

## i3 Stuff
alias eI='nvim ~/.config/i3/config'

## Zsh Stuff
alias eZ='nvim ~/.zshrc'
alias Z='source ~/.zshrc'

## Vim Stuff
alias eV='nvim ~/.config/nvim/init.vim'
alias e='nvim'

## Scripts
alias cdS='cd ~/Scripts'
alias colordump='~/Scripts/colordump.sh'
alias convertMTS='~/Scripts/convertMTS.sh'

## w3m
alias web='cd ~/Podcasts && w3m -cookie www.google.com'

## Power
alias bat='acpi'
alias bat-all='acpi -V'
alias Power='sudo powertop'

###########################################################
########################### ZSH ###########################
###########################################################

# enable vim mode on commmand line
bindkey -v

# no delay entering normal mode
# https://coderwall.com/p/h63etq
# https://github.com/pda/dotzsh/blob/master/keyboard.zsh#L10
# 10ms for key sequences
#KEYTIMEOUT=1

# show vim status
# http://zshwiki.org/home/examples/zlewidgets
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# add missing vim hotkeys
# fixes backspace deletion issues
# http://zshwiki.org/home/zle/vi-mode
bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

# history search in vim mode
# http://zshwiki.org./home/zle/bindkeys#why_isn_t_control-r_working_anymore
bindkey -M viins '^s' history-incremental-search-backward
bindkey -M vicmd '^s' history-incremental-search-backward

###########################################################
######################## FUNCTIONS ######################## 
###########################################################

## Vim help page
:h()  { vim +":h $1" +'wincmd o' +'nnoremap q :q!<CR>' ;}

## Commandline Fu
cmdfu() { curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" \
	| sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" ;}

##Check if websites are down
down4me() { curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g';}

###########################################################
######################### FFMPEG ########################## 
###########################################################

ffx_MONO="1"		# mono
ffx_DUAL="2"		# dual channel
ffx_HW="hw:1,0" 	# alsa; run 'cat /proc/asound/pcm' to change to the correct numbers
ffx_PULSE="pulse" 	# pulseaudio; might have to install pavucontrol to change volume
ffx_FPS="30"		# frame per seconds
ffx_WIN_FULL="1280x768"	# record fullscreen
ffx_AUDIO="pcm_s16le"	# audio codec
ffx_VIDEO="libx264"	# video codec
ffx_PRESET="ultrafast"	# preset error? run 'x264 -h' replace with fast,superfast, slow ..etc
ffx_CRF="0"
ffx_THREADS="0"
ffx_SCALE="scale=1920x1080"	# scale resolution, no black bars on sides of video on youtube
ffx_OUTPUT=~/Screencasts/screencast.mkv
ffx_OUTPUT_FINAL=~/Screencasts/screencast.mp4
# Note: -vf is optional delete if you want, -y is to overwrite existing file

## Concatinate (combine) two or more videos
#ffmpeg -i "concat:input1.avi|input2.avi..." -c copy output.avi

FF-full() { 
	ffmpeg \
	-f alsa \
	-ac $ffx_MONO \
	-i $ffx_PULSE \
	-f x11grab \
	-r $ffx_FPS \
	-s $ffx_WIN_FULL \
	-i :0.0 \
	-acodec $ffx_AUDIO \
	-vcodec $ffx_VIDEO \
	-preset $ffx_PRESET \
	-crf $ffx_CRF \
	-threads $ffx_THREADS \
	-y $ffx_OUTPUT \
#	-vf $ffx_SCALE \
	}

# capture single window, use mouse cursor to select window you want to record
FF-window() { 
	ffx_INFO=$(xwininfo -frame)
    ffmpeg \
    -f alsa \
    -ac $ffx_MONO \
	-i $ffx_PULSE \
    -f x11grab \
    -r $ffx_FPS \
	-s $(echo $ffx_INFO \
    | grep -oEe 'geometry [0-9]+x[0-9]+'\
	| grep -oEe '[0-9]+x[0-9]+') \
	-i :0.0+$(echo $ffx_INFO | grep \
    -oEe 'Corners:\s+\+[0-9]+\+[0-9]+' \
	| grep -oEe '[0-9]+\+[0-9]+' | sed \
    -e 's/\+/,/' ) \
	-acodec $ffx_AUDIO \
    -vcodec $ffx_VIDEO \
    -preset $ffx_PRESET \
    -crf $ffx_CRF \
    -threads $ffx_THREADS \
	-y $ffx_OUTPUT \
            }

FF-convert() {
    ffmpeg \
	-i $ffx_OUTPUT \
	-ar 22050 \
	-ab 32k \
	-strict -2 \
	 $ffx_OUTPUT_FINAL
	}

Convert2mp4() {
    ffmpeg \
	-i $1 \
	-ar 22050 \
	-ab 32k \
	-strict -2 \
	 output.mpeg
	}



## Check Internal and External IPs ##
my-ip() {
        echo "--------------- Network Information ---------------"
	# newer system like arch
	ip addr | awk '/global/ {print $1,$2}' | cut -d\/ -f1
	ip addr | awk '/global/ {print $3,$4}'
	ip addr | awk '/ether/ {print $1,$2}'
	ip addr | awk '/scope link/ {print $1,$2}' | cut -d\/ -f1
	# older system like debian
    ifconfig | awk '/inet addr/ {print $1,$2}' | awk -F: '{print $1,$2}'
    ifconfig | awk '/Bcast/ {print $3}' | awk -F: '{print $1,$2}'
    ifconfig | awk '/inet addr/ {print $4}' | awk -F: '{print $1,$2}'
    ifconfig | awk '/HWaddr/ {print $4,$5}'
    ifconfig | awk '/Scope:Link/ {print $1,$3}' | cut -d\/ -f1
    echo Current IP $(curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+")
    echo "---------------------------------------------------"
}

## Google Translate Functions ##
say() { 

	mplayer -user-agent Mozilla \
	"http://translate.google.com/translate_tts?ie=UTF-8&tl="$1"&q=$(echo "$@" \
	| cut -d ' ' -f2- | sed 's/ /\+/g')" > /dev/null 2>&1 ;}

say-translation() { 

	lang=$1
	trans=$(translate {=$lang} "$(echo "$@" | cut -d ' ' -f2- | sed 's/ /\+/g')" )	
	echo $trans
	mplayer -user-agent Mozilla \
	"http://translate.google.com/translate_tts?ie=UTF-8&tl=$lang&q=$trans" > /dev/null 2>&1 ;}

##############################################################
########################## PODCASTS ########################## 
##############################################################

nvlc-podcast() { nvlc --no-color -S podcast --podcast-urls "$@" ;}
pods-Unfiltered() { nvlc-podcast "http://www.jupiterbroadcasting.com/feeds/unfilterHD.xml" ;}
pods-Scibyte() { nvlc-podcast "http://feeds.feedburner.com/scibytelarge " ;}
pods-RonPaul() { nvlc-podcast "https://www.google.com/url?q=http://www.ronpaul2012podcast.com/feed/&sa=U&ei=h8NIUbzfJoXJiQL4uoCoDw&ved=0CDYQFjAI&sig2=N2y3rxIlKxYDRI-Z9U8yRw&usg=AFQjCNGmGih9EAkV2JfSw2Nj64V90Jk5qg" ;}
pods-StefanMolyneux() { nvlc-podcast "http://feeds.feedburner.com/FreedomainRadioVolume6" ;}
pods-JoeRoganExperience() { nvlc-podcast "htthttp://joeroganexp.joerogan.libsynpro.com/irssp://joeroganexp.joerogan.libsynpro.com/irss" ;}
pods-FreedomFeens() { nvlc-podcast "http://www.freedomfeens.com/feed/" ;}
#pod-() { nvlc-podcast "" ;}

##############################################################
######################## LIVE STREAMS ######################## 
##############################################################

TV-m() { livestreamer -p mplayer "$1" best ;}
TV-v() { livestreamer -p vlc "$1" best ;}

TwitchyMarbs() { livestreamer -p mpv http://www.twitch.tv/Marbozir best ;}
Twitchyllamma() { livestreamer -p mpv http://www.twitch.tv/llamachomp best ;}
TwitchyBeagle() { livestreamer -p mpv http://www.twitch.tv/beagsandjam best ;}
TwitchyQuill() { livestreamer -p mpv http://www.twitch.tv/quill18 best ;}
TwitchyElysium() { livestreamer -p mpv http://www.twitch.tv/enterelysium best ;}

# News
live-news-fox() { livestreamer -p mplayer 'http://www.justin.tv/newswatch_2#/w/5013818384/5' live ;}
 
# Russia Today US
iptv-RT_US() { rtmpdump \
		-r "rtmp://rt.fms-04.visionip.tv/live" \
		-a "live" \
		-f "LNX 11,2,202,270" \
		-W "http://rt.com/s/swf/player5.4.viral.swf" \
		-p "http://rt.com" -y "RT_US_2" \
		| mplayer - ;}

##########################################################
########################## MODS ########################## 
##########################################################

plugins=(git archlinux vi-mode themes zsh-completions color-command) # history-substring-search)
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /home/kronos/Git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/kronos/.oh-my-zsh/oh-my-zsh.sh

# Improved History Search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search

# Clear and Screenfetch
alias clear='clear && neofetch'

clear

# Connect to OU wifi
alias cO="nmcli --ask c u 'OHIO University'"
alias cE="nmcli --ask c u 'eduroam'"

# Disabled shared history
setopt no_share_history

# Fix home and end keys
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
