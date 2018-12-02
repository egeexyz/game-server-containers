FROM egeeio/steamcmd:opensuse

COPY run.sh /usr/bin/run
COPY update.sh /usr/bin/update
RUN chmod +x /usr/bin/run
RUN chmod +x /usr/bin/update
ARG uid
RUN usermod -u ${uid} gsc
ENV update=/update
RUN steamcmd +login anonymous +quit
USER gsc
RUN update
RUN mkdir -p /home/gsc/.steam/sdk32
RUN ln -s /usr/lib/steamcmd/linux32/steamclient.so /home/gsc/.steam/sdk32/steamclient.so
CMD ["run"]
