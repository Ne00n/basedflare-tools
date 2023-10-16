#!/bin/bash
for i in $(echo $1 | tr "," "\n")
do
    echo $i
    scp config root@$i:/etc/gdnsd/config
    ssh root@$i systemctl restart gdnsd
done