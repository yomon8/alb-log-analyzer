#!/bin/bash
BASEDIR=$(cd $(dirname $0) && pwd)
cd ${BASEDIR}
source ./version.conf
rm -fR ./banana
git clone --depth=1 -b ${BANANA_VERSION} https://github.com/lucidworks/banana.git
cd ./banana
ant
cd ..
docker build -t yomon8/alb-banana .
