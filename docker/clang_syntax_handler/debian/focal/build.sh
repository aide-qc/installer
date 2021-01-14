#!/bin/bash

set -x

# Build the deb via Docker
docker build -t csp/focal . --no-cache
docker run -d -P -it --name csp csp/focal
id=$(docker ps -aqf "name=csp") && docker cp $id:/llvm/build/LLVM-12.0.0git-Linux.deb . 
docker stop csp 
docker rm csp