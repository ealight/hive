#!/bin/bash
#
# This file is running on startup

# Start with starting Hadoop services
/etc/docker-startup/bootstrap.sh

# Replace included Hive version with user provided
[ -d /usr/local/custom-hive ] && cd /usr/local && ln -sfn /usr/local/custom-hive hive && echo "RUNNING CUSTOM VERSION!"

# Link config to /etc/hive where we've added hive-site.xml
rm -rf $HIVE_HOME/conf
ln -s /etc/hive $HIVE_HOME/conf

# Start Derby
( cd $DERBY_INSTALL && nohup startNetworkServer & )

$HADOOP_HOME/bin/hdfs dfsadmin -safemode leave \
  && $HADOOP_HOME/bin/hdfs dfs -put $HIVE_HOME/lib/hive-exec*.jar /user/hive/hive-exec.jar

if [ ! -d "$DERBY_HOME/metastore_db" ]
then
  schematool -dbType derby -initSchema
  # Fix schematool constraints schema mistake
  echo "CONNECT 'jdbc:derby://localhost:1527/metastore_db;create=true';
        ALTER TABLE APP.KEY_CONSTRAINTS ALTER COLUMN CHILD_INTEGER_IDX NULL;" > fix
  ij fix | exit
  echo "Schema has been fixed"
else
  echo "Metastore already initialized"
fi

echo "export HDFS_DATANODE=$(hdfs getconf -confkey fs.defaultFS)" > ~/.bashrc
echo "source ~/.bashrc" > ~/.bash_history
echo "beeline -u 'jdbc:hive2://localhost:10000' -n root" > ~/.bash_history

mkdir -p /tmp/root
$HIVE_HOME/bin/hiveserver2 > /tmp/root/hive.out 2> /tmp/root/hive.err &
