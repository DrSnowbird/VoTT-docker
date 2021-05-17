#!/bin/bash -x

if [ ! -s VoTT ]; then
    git clone https://github.com/Microsoft/VoTT.git
fi
cd VoTT
npm ci
npm start

