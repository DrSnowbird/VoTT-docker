#!/bin/bash -x

env
whoami
echo `pwd`

cd $HOME/VoTT
ls -al
npm -v
#npm install # npm@7.10.0
sudo npm install # -g npm@7.13.0
#npm ci
#npm start

