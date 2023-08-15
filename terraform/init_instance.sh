#!/bin/bash -x

LOG_OUT=/tmp/stdout.log
LOG_ERR=/tmp/stderr.log

exec 1> >(tee -a $LOG_OUT)
exec 2>>$LOG_ERR

su - isucon -c 'curl https://github.com/hiroyaonoe.keys >> /home/isucon/.ssh/authorized_keys'
