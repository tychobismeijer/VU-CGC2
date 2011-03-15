#!/bin/bash

# This script write the configuration files
# Run this before hadoop, on the master

bin=`dirname "$0"`
bin=`cd "$bin"; pwd`
conf=`cd "$bin"/../conf; pwd`


cat > "$conf/hadoop/core-site.xml" <<END
<configuration>
     <property>
         <name>fs.default.name</name>
         <value>hdfs://$HOSTNAME:9000</value>
     </property>
</configuration>
END

cat > "$conf/hadoop/mapred-site.xml" <<END
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<!-- Put site-specific property overrides in this file. -->

<configuration>
     <property>
         <name>mapreduce.tracker.adress</name>
         <value>$HOSTNAME:9001</value>
     </property>
</configuration>
END
