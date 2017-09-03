#!/bin/bash

## to allow monitoring check
mkdir -p /certs/.well-known/
echo 'GGT' > /certs/.well-known/index.html

CRT_LIST=/etc/letsencrypt/live/crt-list.txt.tmp
function generate_domain {
	FULLDOMAIN=$1
	echo "Generating $FULLDOMAIN"
	DOMAIN=`echo $FULLDOMAIN|grep -Eo '[^.]+\.[^.]+$'`
	certbot certonly  --keep-until-expiring --expand --text --non-interactive --agree-tos --email letsencrypt@$DOMAIN -d $FULLDOMAIN -a webroot --webroot-path /certs/
	if [ -f "/etc/letsencrypt/live/$FULLDOMAIN/fullchain.pem" ]; then
		cd /etc/letsencrypt/live/$FULLDOMAIN
		cat fullchain.pem privkey.pem > full.pem
		chmod -R go-rwx full.pem
		echo "/etc/haproxy/certs/live/$FULLDOMAIN/full.pem" >> $CRT_LIST
	fi
}

[ ! -f $CRT_LIST ] || rm -rf $CRT_LIST
for subdomain in $DOMAINS
do
	generate_domain $subdomain
done

cat $CRT_LIST > /etc/letsencrypt/live/crt-list.txt
