#!/bin/bash
alosolr -s solr -u ${UPDATE_COUNT} -f <(aloget -b ${S3_BUCKET} -p ${S3_PREFIX} -duration ${DURATION_MINUTES} -stdout)
