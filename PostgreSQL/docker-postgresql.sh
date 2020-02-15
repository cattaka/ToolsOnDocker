#!/bin/sh
APP=postgresql-11

if [ ! -d $HOME/docker_home/$APP ];then
  mkdir -p $HOME/docker_home/$APP
fi

UID=`id -u`
GID=`id -g`

docker run \
--rm \
-e LOCAL_UID=$UID \
-e LOCAL_GID=$GID \
-e LOCAL_USER=$USER \
-v $HOME:/host_home \
-e HOST_HOME=/host_home/docker_home \
-p 5432:5432 \
-ti $USER:$APP $@
