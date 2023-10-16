#!/bin/bash
#bash basesync.sh 1.1.1.1 8.8.8.8
mkdir /tmp/basedflare
rsync -r root@$1:/etc/haproxy/ /tmp/basedflare/
ssh root@$2 systemctl stop haproxy
ssh root@$2 systemctl stop dataplaneapi
rsync -r /tmp/basedflare/map root@$2:/etc/haproxy/
rsync -r /tmp/basedflare/ssl root@$2:/etc/haproxy/
ssh root@$2 systemctl stop dataplaneapi
ssh root@$2 systemctl start haproxy
rm -r /tmp/basedflare