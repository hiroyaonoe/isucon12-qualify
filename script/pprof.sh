#! /bin/bash -ex

# TODO: 以下埋める
URL=localhost:6060 #localの6060にport-forwardした場合
SOURCE_PATH=~/src/github.com/hiroyaonoe/isucon12-qualify/webapp/go/isuports # localでもbuildしておく
SECONDS=$1

if [ -z $SECONDS ]; then
  echo "Please set SECONDS(120くらい?)"
  exit 1
fi

# ローカルから実行することを想定 (http://localhost:1080で見れる)
go tool pprof -http=localhost:1080 ${SOURCE_PATH} http://${URL}/debug/pprof/profile?seconds=${SECONDS}
