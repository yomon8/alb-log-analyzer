#!/bin/bash
BASEDIR=$(cd $(dirname $0) && pwd)
cd ${BASEDIR}
source ../conf/env.sh
echo $AWSENVFILE
docker run --name ${CONTAINERNAME} -d -p ${SOLRPORT}:${SOLRPORT} yomon8/alb-banana:${CONTAINERNAME_SRV_VERSION}
sleep 3
./loaddata.sh

