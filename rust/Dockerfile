FROM egeeio/steamcmd:latest
COPY "./build/run.sh" "/usr/bin/run"
COPY "./build/update.sh" "/usr/bin/update"
ARG uid
RUN usermod -u ${uid} gsc
RUN apt-get update && apt-get install -y bzip2 unzip bsdmainutils lib32gcc1 libstdc++6 libstdc++6:i386 lib32z1
USER gsc
ENV LD_LIBRARY_PATH=/home/gsc/server_files:/home/gsc/server_files/RustDedicated_Data:{$LD_LIBRARY_PATH}
CMD ["run"]
