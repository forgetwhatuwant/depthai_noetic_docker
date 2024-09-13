#! /bin/bash
docker container run -it --rm  --privileged --net=host  \
    --volume=/dev:/dev \
    ros:noetic-perception-oak\
    bash