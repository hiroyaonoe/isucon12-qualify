#! /bin/bash -ex

SERVER=`hostname`
echo "SERVER = ${SERVER}"

if [ -z $SERVER ]; then
  echo "Please set SERVER"
  exit 1
fi

cd server${SERVER}
find "etc" -type f | while read line; do
  cp -r "./$line" "/$line"
done
