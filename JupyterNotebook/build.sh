#!/bin/sh
BASEDIR=$(dirname "$0")
docker build -t $USER:jupyter $BASEDIR
