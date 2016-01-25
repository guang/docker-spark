#!/bin/sh

# name resolution for spark-master
echo "${SPARK_MASTER_SERVICE_HOST:-$1} guang.spark" >> /etc/hosts

# because the hostname only resolves locally
export SPARK_LOCAL_HOSTNAME=$(hostname -i)

$SPARK_HOME/sbin/start-slave.sh spark://guang.spark:7077

# TODO: detect slave exit
tail -F $SPARK_HOME/logs/*
