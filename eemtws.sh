#!/bin/bash
# deploy/undeploy eemt web service
deploydir=/srv/opal2-deploy
srcdir=/srv/eemt-opal2/src
if [ "$1" == "install" ]; then
	if [ -f $deploydir/eemtlocal.xml ]; then
		echo "uninstall EEMT..."
		rm -f $deploydir/eemtlocal.xml
		sleep 5
	fi
	echo "install EEMT..."
	cp $srcdir/opal2/eemtlocal.xml $deploydir/
elif [ "$1" == "clean" ]; then
	echo "uninstall EEMT..."
	if [ -f $deploydir/eemtlocal.xml ]; then
		rm -f $deploydir/eemtlocal.xml
	fi
else 
	echo "Usage: $0 install|clean"
fi
