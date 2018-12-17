FROM egeeio/steamcmd:latest

USER root
COPY update.sh /usr/bin/update
COPY run.sh /usr/bin/run

ARG uid
RUN usermod -u ${uid} gsc
USER gsc

RUN mkdir /home/gsc/starbound
RUN mkdir /home/gsc/starbound/storage
COPY starbound_server.config /home/gsc/starbound/storage/starbound_server.config
WORKDIR /home/gsc/starbound

#This part is nasty
ARG S_USERNAME
ARG S_PASSWORD
ARG S_GUARD
RUN /usr/bin/update ${S_USERNAME} ${S_PASSWORD} ${S_GUARD}

CMD ["run"]
