#! /bin/bash -ex

# TODO: サービス名、パスは適宜変更

cd ~/webapp/go
make isuports
sudo systemctl daemon-reload
sudo systemctl restart isuports.service
sudo systemctl restart nginx.service # reloadでも良い
sudo systemctl restart mysql.service
