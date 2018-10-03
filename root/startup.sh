#!/bin/bash

role=${1:-master}

if [ "$role" = master ]; then
    echo "Starting Spark master!"
    /opt/spark/sbin/start-master.sh
elif [ "$role" = slave ]; then
    echo "Starting Spark slave!"
    /opt/spark/sbin/start-slave.sh spark://spark-master:7077
else
  echo "Value $role is unknown!!!"
fi

tail -f /opt/spark/logs/*
