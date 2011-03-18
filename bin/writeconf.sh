#!/bin/bash

# This script write the configuration files
# Run this before hadoop, on the master

bin=`dirname "$0"`
bin=`cd "$bin"; pwd`
conf="/home/tbr440/cgc2/run/conf/hadoop"
run="/home/tbr440/cgc2/run/hadoop/"

cat > "${conf}/core-site.xml" <<END
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<configuration>
     <property>
         <name>fs.default.name</name>
         <value>hdfs://$HOSTNAME:9000</value>
     </property>
</configuration>
END

cat > "${conf}/mapred-site.xml" <<END
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<configuration>
     <property>
         <name>mapreduce.tracker.adress</name>
         <value>$HOSTNAME:9001</value>
     </property>
</configuration>
END

cat > "${run}/slaves" <<END
$HOSTNAME
END

cat > "${run}/masters" <<END
$HOSTNAME
END
