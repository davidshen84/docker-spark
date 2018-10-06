#!/bin/bash

set -m

role=${1:-master}
PID=

start() {
  if [ "$role" = master ]; then
    echo "Starting Spark master!"
    /opt/spark/sbin/start-master.sh
  elif [ "$role" = slave ]; then
    echo "Starting Spark slave!"
    /opt/spark/sbin/start-slave.sh spark://spark-master:7077
  else
    echo "Value $role is unknown!!!"
  fi

  tail -f /data/logs/* &
  PID=$!
}

stop() {
  if [ "$role" = master ]; then
    echo "Stopping Spark master!"
    /opt/spark/sbin/stop-master.sh
  elif [ "$role" = slave ]; then
    echo "Stopping Spark slave!"
    /opt/spark/sbin/stop-slave.sh
  else
    echo "Value $role is unknown!!!"
  fi

  kill -TERM $PID
  exit 0
}

trap stop SIGTERM SIGINT
start
wait $PID

