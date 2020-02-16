#!/bin/sh
DIRNAME=`dirname $0`

EX_OPT=""

if [ -n "$GOOGLE_APPLICATION_CREDENTIALS" ]; then
  EX_OPT="$EX_OPT -v $GOOGLE_APPLICATION_CREDENTIALS:/opt/creds -e GOOGLE_APPLICATION_CREDENTIALS=/opt/creds"
fi

if [ ! -d $HOME/docker_home/work ];then
  mkdir -p $HOME/docker_home/work
fi

if [ -f $DIRNAME/.env ];then
  . $DIRNAME/.env
fi
if [ -n "$NB_PASSWORD" ];then
  NB_PASSWORD_OPTION="--NotebookApp.password='$NB_PASSWORD'"
fi

UID=`id -u`
NB_PORT=18888

docker run  \
-u $UID \
--rm \
$EX_OPT \
-v /dev/bus/usb:/dev/bus/usb \
-v /media:/media \
-e TZ=Asia/Tokyo \
-p $NB_PORT:$NB_PORT \
--name notebook \
-v $HOME/docker_home:/home/jovyan \
$USER:jupyter \
start-notebook.sh \
--port $NB_PORT \
$NB_PASSWORD_OPTION

