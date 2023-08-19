#! /bin/bash -ex

SERVER=`hostname`
echo "SERVER = ${SERVER}"
directory=$2

if [ -z $SERVER ]; then
  echo "Please set SERVER"
  exit 1
fi

mkdir -p "./server${SERVER}"`dirname $directory`
cp -ir "$directory" "./server${SERVER}$directory"

chmod -R 777 "./server${SERVER}"
