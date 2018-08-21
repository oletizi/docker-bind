#!/bin/bash

bindir=`dirname $0`
cd $bindir
bindir=`pwd`

cd ${bindir}/..
root=`pwd`

echo "root: ${root}"

bind_image_name=oletizi/docker

cd ${root}/docker/bind

cmd="docker build -f ./Dockerfile -t ${bind_image_name} ."
echo "Executing ${cmd}..."
${cmd}
