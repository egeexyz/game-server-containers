FROM egeeio/java:latest
COPY "./build/run.sh" "/usr/bin/run"
COPY "./build/update.sh" "/usr/bin/update"
ARG uid
RUN usermod -u ${uid} gsc
USER gsc
CMD ["run"]

