FROM {{BASE_IMAGE}}
# FROM ubuntu:18.04

{{FORCE_DOCKER_RUN}}

ENV SERVER_DIR /home/gsc/server_files
ENV CACHE_DIR /home/gsc/server_files/update_cache
ENV POST_INSTALL /home/gsc/post_install

COPY "./build/run.sh" "/usr/bin/run"
COPY "./build/update.sh" "/usr/bin/update"

RUN chmod +x /usr/bin/run && chmod +x /usr/bin/update

# RUN useradd -m gsc

ARG uid
RUN usermod -u ${uid} gsc
USER gsc

CMD ["run"]

