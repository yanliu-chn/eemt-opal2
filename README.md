# EEMT OPAL2 Web Service
Definition and install scripts for EEMT OPAL2 web service on XSEDE/OSG.

- `eemtlocal` and `sollocal` uses a local DEM file as input to EEMT and SOL model. 
- `solot` uses external DEM sources (as URL input) to SOL model. Jobs are submitted to OSG.
- `solotcomet` uses Comet@SDSC as computing cluster, instead of OSG.

software dependencies:
<pre>
jdk1.7.0_80
apache-ant-1.9.6-bin.tar.gz           
apache-tomcat-6.0.44.tar.gz          
opal-ws-2.5.tar.gz
</pre>

To deploy onto a new machine, please: 

1. change opal2 config in `src/opal2/opal.properties` to set the new `tomcat.url` value. 
2. install all the dependencies and set software environment accordingly:
<pre>
# opal2 env
export JAVA_HOME=/srv/jdk1.7.0_80
export ANT_HOME=/srv/apache-ant-1.9.6
#export CATALINA_HOME=/srv/apache-tomcat-7.0.65
export CATALINA_HOME=/srv/apache-tomcat-6.0.44
export OPAL_HOME=/srv/opal-ws-2.5
export PATH=$ANT_HOME/bin:$JAVA_HOME/bin:$PATH
</pre>
3. `cd /srv/eemt-opal2/`
4. `reinstall-opal2.sh`
5. `eemtws.sh install`

Then open the URL to go to the opal2 dashboard.

Please make sure a java SDK and Apache Ant are preinstalled before running reinstall-opal2.sh

If you deploy wrappers somewhere else than the default locations, change opal2 service config in `src/opal2/` to set new executable path in `binaryLocation` element.

Yan Y. Liu <yanliu@illinois.edu>
