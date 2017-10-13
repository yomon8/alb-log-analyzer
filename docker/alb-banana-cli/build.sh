#!/bin/bash
BASEDIR=$(cd $(dirname $0) && pwd)
cd ${BASEDIR}
docker build -t yomon8/alb-banana-cli .
