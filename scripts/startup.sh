#!/bin/bash
echo -e "[vhosts]\n$HOST:5984 = /registry/_design/app/_rewrite" >> /usr/local/etc/couchdb/local.d/npmjs-vhost.ini
echo -e "127.0.0.1\t$HOST" >> /etc/hosts
cat /opt/npmjs/kappa.json.default|sed -e "s/\${hostname}/$HOST/" > /opt/npmjs/kappa.json
couchdb -b; hapi -c /opt/npmjs/kappa.json & tail -f /usr/local/var/log/couchdb/couch.log
