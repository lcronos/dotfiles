#!/bin/sh
install()
{
	echo "Installing google-play-music."
	cp -r ~/Downloads/google-play-music-desktop-player_4.2.0_amd64/usr/* /usr/
}

uninstall()
{
	echo "Uninstalling google-play-music."
	rm /usr/bin/google-play-music-desktop-player
	rm /usr/share/applications/google-play-music-desktop-player.desktop
	rm -r /usr/share/doc/google-play-music-desktop-player/
	rm /usr/share/lintian/overrides/google-play-music-desktop-player
	rm /usr/share/pixmaps/google-play-music-desktop-player.png
}
if [[ $EUID -ne 0 ]]; then
	if [[ $1 == "install" ]]; then
		$1
	elif [[ $1 == "uninstall" ]]; then
		$1
	else
		echo "USAGE: ./install-gplaymusic.sh <options>
			install     install package
			uninstall   uninstall package"
	fi
else
	if [[ $1 == "install" ]]; then
		sudo $0 $1
	elif [[ $1 == "uninstall" ]]; then
		sudo $0 $1
	else
		echo "USAGE: ./install-gplaymusic.sh <options>
			install     install package
			uninstall   uninstall package"
	fi
fi
