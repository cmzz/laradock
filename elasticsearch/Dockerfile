ARG ELK_VERSION=7.5.1
ARG IK_PLUGIN=elasticsearch-analysis-ik-${ELK_VERSION}.zip

FROM docker.elastic.co/elasticsearch/elasticsearch:${ELK_VERSION}

COPY plugins/elasticsearch-analysis-ik-7.5.1.zip /usr/share/
RUN ls /usr/share/elasticsearch-analysis-ik-7.5.1.zip

RUN if [ -f /usr/share/elasticsearch-analysis-ik-7.5.1.zip ];then \
    /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch file:///usr/share/elasticsearch-analysis-ik-7.5.1.zip; \
    else \
    /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${ELK_VERSION}/elasticsearch-analysis-ik-${ELK_VERSION}.zip \
    ;fi

EXPOSE 9200 9300
