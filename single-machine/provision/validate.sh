#!/bin/bash
echo "Listing installed packages..."
set -x
echo "Docker packages..."
docker version
docker-compose -v
docker-machine -v

echo "Testing docker..."
docker run -i --rm hello-world

echo "Node packages..."
node -v
npm -v

echo "Git packages..."
git --version
