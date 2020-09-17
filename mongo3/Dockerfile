FROM mongo:latest

LABEL maintainer="Mahmoud Zalt <mahmoud@zalt.me>"

#COPY mongo.conf /usr/local/etc/mongo/mongo.conf

VOLUME /data/db /data/configdb

# CMD ["mongod", '--auth']

CMD ["mongod", "--bind_ip_all", "--replSet", "rs0"]

EXPOSE 27017

