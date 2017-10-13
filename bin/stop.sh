#!/bin/bash
BASEDIR=$(cd $(dirname $0) && pwd)
cd ${BASEDIR}
source ../conf/env.sh
docker rm -f ${CONTAINERNAME} 
