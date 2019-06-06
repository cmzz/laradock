FROM python:3

WORKDIR /var/www


ARG PUID=1000
ENV PUID ${PUID}
ARG PGID=1000
ENV PGID ${PGID}

RUN set -xe; \
    apt-get update -y && \
    groupadd -g ${PGID} laradock && \
    useradd -u ${PUID} -g laradock -m laradock && \
    usermod -p "*" laradock -s /bin/bash && \
    apt-get install -y vim supervisor cron

###########################################################################
# Crontab
###########################################################################

USER root

COPY ./crontab /etc/cron.d

RUN chmod -R 644 /etc/cron.d && \
    crontab /etc/cron.d/laradock


#
#--------------------------------------------------------------------------
# Optional Supervisord Configuration
#--------------------------------------------------------------------------
#
# Modify the ./supervisor.conf file to match your App's requirements.
# Make sure you rebuild your container with every change.
#

COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]