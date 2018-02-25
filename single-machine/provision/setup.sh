#!/bin/bash

function prereqs {
  apt-get update \
    && apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common \
      git
}

function docker {
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   apt-get update \
   && apt-get install -y docker-ce \
   && curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose \
   && curl -L https://github.com/docker/machine/releases/download/v0.12.2/docker-machine-`uname -s`-`uname -m` >/usr/local/bin/docker-machine \
   && chmod +x /usr/local/bin/docker-* \
   && usermod -G docker ubuntu
}

function nodejs {
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  apt-get install -y nodejs
}

function cleanup {
  apt-get autoremove -y
}

prereqs
nodejs
docker
cleanup
