#!/usr/bin/env bash

bindir=`dirname $0`
cd $bindir
bindir=`pwd`

. ./dockersettings.sh

cd $bindir/..
root=`pwd`
container_name=$bind_container_name
image_name=$bind_image_name

logfile=${HOME}/${container_name}.log
echo "" > $logfile

#docker pull $image_name
docker stop $container_name
docker rm $container_name

docker run \
       --name $container_name \
       --restart always \
       -p 53:53/tcp \
       -p 53:53/udp \
       -p 10000:10000/tcp \
       -v ${HOME}/bind/:/data \
       ${image_name} > ${logfile} 2>&1 &
