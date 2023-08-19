#! /bin/bash -ex

# alp
wget https://github.com/tkuchiki/alp/releases/download/v1.0.14/alp_linux_amd64.tar.gz
tar -zxvf alp_linux_amd64.tar.gz
sudo install ./alp /usr/local/bin/alp
rm alp alp_linux_amd64.tar.gz

# pt-query-digest
sudo apt-get update
sudo apt-get install -y percona-toolkit
