FROM egeeio/steamcmd

RUN apt-get install -y mono-complete
COPY run.sh /usr/bin/run
RUN chmod +x /usr/bin/run
ARG uid
RUN usermod -u ${uid} gsc
USER gsc
RUN mkdir /home/gsc/terraria
WORKDIR /home/gsc/terraria
RUN wget "https://github.com/Pryaxis/TShock/releases/download/v4.3.25/tshock_4.3.25.zip"
RUN unzip -x tshock*.zip
RUN chmod +x /home/gsc/terraria/TerrariaServer.exe
WORKDIR /home/gsc/
CMD ["run"]
