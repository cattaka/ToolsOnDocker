#!/bin/sh
BASEDIR=$(dirname "$0")
docker build -t $USER:xpra $BASEDIR
