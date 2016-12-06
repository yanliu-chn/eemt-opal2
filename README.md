# EEMT OPAL2 Web Service
Definition and install scripts for EEMT OPAL2 web service on XSEDE/OSG.

`eemtlocal` uses a local DEM file as input. `eemtremote` uses external DEM sources (opentopo or cybergis)

software dep:
jdk1.7.0_80
apache-ant-1.9.6-bin.tar.gz           
apache-tomcat-6.0.44.tar.gz          
opal-ws-2.5.tar.gz

To deploy onto a new machine, please change opal2 config in `src/opal2/opal.properties` to set the new `tomcat.url` value.

Please make sure a java SDK and Apache Ant are preinstalled before running reinstall-opal2.sh

If you deploy wrappers somewhere else than the default locations, change opal2 service config in `src/opal2/` to set new executable path in `binaryLocation` element.

Yan Y. Liu <yanliu@illinois.edu>
