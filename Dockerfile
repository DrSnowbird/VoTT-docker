FROM openkbs/jdk-mvn-py3-x11

MAINTAINER DrSnowbird "DrSnowbird@openkbs.org"

# fix yarn key
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN sudo apt-get update
    
#### ------------------------
#### ---- VoTT:   ----
#### ------------------------
RUN mkdir ${HOME}/VoTT

WORKDIR ${HOME}/VoTT
COPY . .
RUN sudo chown -R $USER:$USER ${HOME} && \
    ls -al $HOME/VoTT
RUN npm install # ci

#### ------------------------
#### ---- Use entrypoint ----
#### ------------------------
#### --- Copy Entrypoint script in the container ---- ####
COPY ./docker-entrypoint.sh /

#### --- Enterpoint for container ---- ####
USER ${USER}
WORKDIR ${HOME}/VoTT

ENTRYPOINT ["/docker-entrypoint.sh"]

#CMD ["npm", "start"]
