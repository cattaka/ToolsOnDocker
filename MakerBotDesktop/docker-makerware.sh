#!/bin/sh
if [ ! -d $HOME/docker_home ];then
  mkdir -p $HOME/docker_home
fi

UID=`id -u`

docker run \
-u $UID \
--rm \
-v /dev/bus/usb:/dev/bus/usb \
-v /media:/media \
-v $HOME:/host_home \
-e HOME=/host_home/docker_home \
-e DISPLAY=$DISPLAY \
-v /tmp/.X11-unix/:/tmp/.X11-unix \
-ti $USER:makerware
