FROM docker.elastic.co/elasticsearch/elasticsearch:7.1.1

RUN /usr/share/elasticsearch/bin/elasticsearch-plugin install --batch https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.1.1/elasticsearch-analysis-ik-7.1.1.zip

EXPOSE 9200 9300
