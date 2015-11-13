#!/bin/bash
# handy tool to clean up old opal2 and tomcat and install new instance
# sometimes, opal2 uses config from old config of tomcat, so need to do fresh

[ "`whoami`" != "eemt" ] && echo "must run as user 'eemt'" && exit 0

echo "get rid of old install..."
$CATALINA_HOME/bin/catalina.sh stop
rm -fr $CATALINA_HOME/*
rm -fr $OPAL_HOME/*
deploydir=/srv/opal2-deploy
rm -fr $deploydir/*

echo "install new..."
cd $CATALINA_HOME/..
tar xfz /srv/software/apache-tomcat-6.0.44.tar.gz
tar xfz /srv/software/opal-ws-2.5.tar.gz
$CATALINA_HOME/bin/catalina.sh start
sleep 20
$CATALINA_HOME/bin/catalina.sh stop

# deploy configs
srcdir=/srv/eemt-opal2/src
echo "deploy tomcat ..."
cp $srcdir/tomcat/tomcat-users.xml $CATALINA_HOME/conf/
mkdir -p $CATALINA_HOME/deploy
echo "deploy opal2 ..."
cp $srcdir/opal2/build.properties $OPAL_HOME/
cp $srcdir/opal2/opal.properties $OPAL_HOME/etc/
ln -s /srv/eemtws-jobs $CATALINA_HOME/webapps/opal-jobs
cp $srcdir/opal2/web.xml $OPAL_HOME/webapps/opal2/WEB-INF/

echo "ant install ..."
cd $OPAL_HOME
ant install

cp $OPAL_HOME/configs/cat_config.xml $deploydir/cat.xml

echo "TODO: $CATALINA_HOME/bin/catalina.sh run"
