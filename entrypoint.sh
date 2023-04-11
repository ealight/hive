#!/bin/bash

# Start Hadoop and Hive services
/etc/docker-startup/hive-bootstrap.sh && tail -f /dev/null
