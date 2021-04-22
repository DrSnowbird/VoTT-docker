FROM openkbs/jdk-mvn-py3-x11

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

ENV DISPLAY=${DISPLAY:-":0.0"}

#### --- Copy Entrypoint script in the container ---- ####
COPY ./docker-entrypoint.sh /

RUN sudo apt update -y
    
ENV DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

RUN sudo chmod -R 0777 /host/run/dbus/system_bus_socket

#### ------------------------
#### ---- VoTT:   ----
#### ------------------------
RUN mkdir ${HOME}/VoTT

WORKDIR ${HOME}/VoTT
COPY . .
RUN sudo chown -R $USER:$USER ${HOME} && \
    ls -al $HOME/VoTT
    
#### ------------------------
#### ---- user: Non-Root ----
#### ------------------------

#### --- Enterpoint for container ---- ####
USER ${USER}
WORKDIR ${HOME}/VoTT

ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD ["/usr/bin/firefox"]
#CMD ["/usr/bin/google-chrome","--no-sandbox","--disable-gpu", "--disable-extensions"]
#CMD ["npm", "start"]


