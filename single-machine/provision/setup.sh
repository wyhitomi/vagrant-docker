#!/bin/bash

function prereqs {
  apt-get update \
    && apt-get install -y \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common \
      git \
      git-core \
      vim \
      tmux \
      htop \
      net-tools

}

function docker {
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
  add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/debian \
     $(lsb_release -cs) \
     stable"
   apt-get update \
     && apt-get install -y docker-ce \
     && curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose \
     && chmod +x /usr/local/bin/docker-* \
     && usermod -G docker vagrant
}

function nodejs {
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  apt-get install -y nodejs
}

function cleanup {
  apt-get autoremove -y
}

prereqs
# nodejs
docker
cleanup
