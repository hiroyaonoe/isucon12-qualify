#! /bin/bash -ex

SERVER=$1 # 数字を指定
directory=$2

if [ -z $SERVER ]; then
  echo "Please set SERVER"
  exit 1
fi

mkdir -p "./server${SERVER}"`dirname $directory`
cp -ir "$directory" "./server${SERVER}$directory"

chmod -R 777 "./server${SERVER}"
