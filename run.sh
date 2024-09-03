#! /bin/bash
docker container run -it --rm  --privileged --net=host  \
    --volume=/dev:/dev \
    armv8_oak:noetic-focal-oak\
    bash