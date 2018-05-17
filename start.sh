#!/bin/bash

## to allow monitoring check
mkdir -p /certs/.well-known/
echo 'GGT' > /certs/.well-known/index.html


CRT_LIST=/etc/letsencrypt/live/crt-list.txt.tmp
FLAG=/certs/.well-known/loading.html

[ ! -f $CRT_LIST ] || rm -rf $CRT_LIST
[ ! -f $FLAG ] || rm -rf $FLAG

function generate_domain {
	FULLDOMAIN=$1
	echo "Generating $FULLDOMAIN"
	DOMAIN=`echo $FULLDOMAIN|grep -Eo '[^.]+\.[^.]+$'`
	certbot certonly  --keep-until-expiring --expand --text --non-interactive --agree-tos --email letsencrypt@$DOMAIN -d $FULLDOMAIN -a webroot --webroot-path /certs/
}

## generate non-wildcard domain
for subdomain in $DOMAINS
do
	generate_domain $subdomain
done

## create haproxy file
find /etc/letsencrypt/live/ -mindepth 1 -maxdepth 1 -type d| while read i
do
	cd $i
        if [ -f "fullchain.pem" ]; then
		FULLDOMAIN=`basename $i`
                cat fullchain.pem privkey.pem > full.pem
                chmod -R go-rwx full.pem
                echo "/etc/haproxy/certs/live/$FULLDOMAIN/full.pem" >> $CRT_LIST
        fi
done
cat $CRT_LIST > /etc/letsencrypt/live/crt-list.txt
touch $FLAG

## renew all
certbot renew
