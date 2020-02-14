ARG ELK_VERSION=7.5.1
ARG localPlugin=./pulgins/elasticsearch-analysis-ik-${ELK_VERSION}.zip

FROM docker.elastic.co/elasticsearch/elasticsearch:${ELK_VERSION}

COPY ./plugins /root

RUN if [ -f /root/${localPlugin} ];then \
    /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch file:///root${localPlugin} \
    ;else \
    /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${ELK_VERSION}/elasticsearch-analysis-ik-${ELK_VERSION}.zip \
    ;fi

EXPOSE 9200 9300
