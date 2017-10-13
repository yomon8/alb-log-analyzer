#!/bin/bash
BASEDIR=$(cd $(dirname $0) && pwd)
cd ${BASEDIR}
source ../conf/env.sh
source ../conf/awsenv.sh
docker run -it \
 -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
 -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
 -e AWS_REGION=${AWS_REGION} \
 -e S3_BUCKET=${S3_BUCKET} \
 -e S3_PREFIX=${S3_PREFIX} \
 -e DURATION_MINUTES=${DURATION_MINUTES} \
 --link ${CONTAINERNAME}:solr yomon8/alb-banana-cli

