#!/bin/sh
if [ ! -d $HOME/docker_home ];then
  mkdir -p $HOME/docker_home
fi

UID=`id -u`

docker run \
-u $UID \
--rm \
-e USERNAME=$USERNAME \
-e DISPLAY=$DISPLAY \
-e SSH_AUTH_SOCK=/ssh-agent \
-v $SSH_AUTH_SOCK:/ssh-agent \
-v $HOME:/host_home \
-e HOME=/host_home/docker_home \
-v /tmp/.X11-unix/:/tmp/.X11-unix \
-ti $USER:xpra $@
