#!/bin/bash

#auto heap
limit_in_bytes=$(cat /sys/fs/cgroup/memory/memory.limit_in_bytes)
if [ "$limit_in_bytes" -ne "9223372036854771712" -a "$limit_in_bytes" -ne "9223372036854775807" ]
then
    limit_in_megabytes=$(expr $limit_in_bytes \/ 1048576)
    heap_size=$(expr $limit_in_megabytes \* 3 \/ 4)
    export JAVA_OPTS="-Xmx${heap_size}m $JAVA_OPTS"
    echo JAVA_OPTS=$JAVA_OPTS
fi
if [ "$BUILD_ENV" == "TEST" ]
then
export JACOCO_OPTS="-javaagent:/opt/tools/qa/jacocoagent.jar=includes=*,output=tcpserver,address=*,port=36300"
export JAVA_OPTS="$JAVA_OPTS $JACOCO_OPTS"
fi
cd bin
nohup java $JAVA_OPTS -jar ./ecp-service-1.0.0-SNAPSHOT.jar  &

while true
do
	sleep 2
done
