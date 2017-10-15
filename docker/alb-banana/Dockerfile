FROM solr:7.0.1-alpine

COPY ./banana/build/banana-*.war /opt/solr/server/solr-webapp/webapp/banana.war
COPY ./banana-context.xml /opt/solr/server/contexts/
COPY ./cores/ /opt/solr/server/solr/mycores/
USER root
RUN chown -R solr:solr /opt/solr/server/solr/mycores/


USER solr
ENTRYPOINT ["docker-entrypoint.sh","solr-precreate","alb-log"]




