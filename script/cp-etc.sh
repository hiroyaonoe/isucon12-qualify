#! /bin/bash -ex

SERVER=`hostname`
echo "SERVER = ${SERVER}"

if [ -z $SERVER ]; then
  echo "Please set SERVER"
  exit 1
fi

cd ${SERVER}
find "etc" -type f | while read line; do
  sudo cp -r "./$line" "/$line"
done
