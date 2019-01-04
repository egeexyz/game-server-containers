FROM egeeio/rustserver

COPY run.sh /usr/bin/run
COPY update.sh /usr/bin/update

WORKDIR /opt/rustserver
ENV LD_LIBRARY_PATH=/opt/rustserver:/opt/rustserver/RustDedicated_Data:{$LD_LIBRARY_PATH}
ENV update=/update
ENV run=/run
RUN chmod +x /usr/bin/run
RUN chmod +x /usr/bin/update
RUN update
CMD ["/usr/bin/run"]