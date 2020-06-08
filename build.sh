#!/usr/bin/env sh
docker build --build-arg ALPINE_VERSION=3.9 -t unleashed/ansible:2.7 .
docker build --build-arg ALPINE_VERSION=3.12 -t unleashed/ansible:2.9 .
docker build -t unleashed/ansible:latest .

docker push unleashed/ansible:2.7
docker push unleashed/ansible:2.9
docker push unleashed/ansible:latest
