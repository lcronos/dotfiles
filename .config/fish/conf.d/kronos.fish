set -gx LC_ALL en_US.UTF-8
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g EDITOR nvim
set -gx SUDO_EDITOR nvim
set -g XDG_CACHE_HOME $HOME/.cache
set -gx --path XDG_DATA_DIRS "/usr/local/share/:/usr/share/:/var/lib/flatpak/exports/share/:/home/kronos/.local/share/flatpak/exports/share/"
alias clear="clear && neofetch"
alias lutris="lxc exec lutris -- sudo --login --user ubuntu /usr/games/lutris"
xhost +local:
neofetch
