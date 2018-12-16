FROM egeeio/generic
RUN apt update && apt install -y git zlib1g-dev python3-pip python3
RUN pip3 install --upgrade pip
COPY "./build/run.sh" "/usr/bin/run"
COPY "./build/update.sh" "/usr/bin/update"
ARG uid
RUN usermod -u ${uid} gsc
USER gsc
CMD ["run"]
