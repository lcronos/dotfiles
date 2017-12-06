#!/bin/sh
if [ $(date +\%d) -le 07 ]; then
	/home/kronos/Gentoo-Scripts/monthlyupdate.sh
else
	/home/kronos/Gentoo-Scripts/weeklyupdate.sh
fi
