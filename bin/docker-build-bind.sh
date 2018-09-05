#!/bin/bash

bindir=`dirname $0`
cd $bindir
bindir=`pwd`

. ./dockersettings.sh

cd ${bindir}/..
root=`pwd`

image_name=${bind_image_name}

cd ${root}/docker/bind

cmd="docker build -f ./Dockerfile -t ${image_name} ."
echo "Executing ${cmd}..."
${cmd}
