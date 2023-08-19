#! /bin/bash -ex

SERVER=$1 # 数字を指定
DIRECTORIES="/etc/mysql /etc/nginx /etc/systemd/system /etc/sysctl.conf /etc/sysctl.d"

if [ -z $SERVER ]; then
  echo "Please set SERVER"
  exit 1
fi

mkdir -p "server${SERVER}/etc"
for directory in $DIRECTORIES; do
  mkdir -p "./server${SERVER}"`dirname $directory`
  cp -ir "$directory" "./server${SERVER}$directory"
done
