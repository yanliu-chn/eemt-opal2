#!/bin/bash
# deploy/undeploy eemt web service
deploydir=/srv/opal2-deploy
srcdir=/srv/eemt-opal2/src

wslist="eemtlocal simpletest"

function eemt_uninstall {
	for ws in $wslist; do
		if [ -f $deploydir/${ws}.xml ]; then
			echo "uninstalling $ws ..."
			rm -f $deploydir/${ws}.xml
		fi
	done
}

if [ "$1" == "install" ]; then
	eemt_uninstall
	sleep 5
	for ws in $wslist; do
		echo "installing $ws ..."
		cp $srcdir/opal2/${ws}.xml $deploydir/
	done
elif [ "$1" == "clean" ]; then
	eemt_uninstall
else 
	echo "Usage: $0 install|clean"
fi
