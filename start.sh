#!/bin/bash

#add hostname and iterface ip to hosts
echo -e "$(ip -o route get 8.8.8.8 | sed -e 's/^.* src \([^ ]*\) .*$/\1/') $(hostname)" >> /etc/hosts

#start all cluster
docker-compose up -d