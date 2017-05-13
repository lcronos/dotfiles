#!/bin/bash
function update()
{
	echo "Starting update"
	echo "Updating Portage Tree and Overlays"
	emaint sync --auto
	echo "Regenerating Cache"
	( ulimit -n 4096 && emerge --regen )
	echo "Updating eix"
	cp -a /var/cache/eix/portage.eix /var/cache/eix/previous.eix
	eix-update
	eix-diff
	echo "Updating packages"
	emerge -uDN --with-bdeps=y --backtrack=1000 --keep-going @world
	echo "Removing unneeded dependencies"
	emerge -ac
	echo "Rebuilding needed dependencies"
	revdep-rebuild
	echo "Update Complete"
}


if [[ $EUID -ne 0 ]]; then
	sudo $0
else
	update
fi

