#!/bin/bash -ex

DOCKER_REPO=admantic/vagrant-docker-boxes

cd $(dirname "$(readlink $0)")

for DOCKERFILE in */Dockerfile ; do
  (
    TAG=${DOCKERFILE%%/Dockerfile}
    cd $TAG
    docker build -t $DOCKER_REPO:$TAG . -f Dockerfile
    docker push $DOCKER_REPO:$TAG
  )
done
