#!/bin/bash

docker run \
    -it \
    --rm \
    -p 3000:3000 \
    -e CHOKIDAR_USEPOLLING=true \
    moaazzaki/jdc-client
    
docker run \
--rm \
-p 3001:3001 \
moaazzaki/jdc-server
