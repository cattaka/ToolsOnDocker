#!/bin/bash

USER_ID=${LOCAL_UID:-9001}
GROUP_ID=${LOCAL_GID:-9001}
USER=${LOCAL_USER:-user}

echo "Starting with UID : $USER_ID, GID: $GROUP_ID"
useradd -u $USER_ID -o -m $USER
groupmod -g $GROUP_ID $USER

exec /usr/sbin/gosu $USER "$@"
