# letsencrypt

[![Docker Hub repository](http://dockeri.co/image/nouchka/letsencrypt)](https://registry.hub.docker.com/u/nouchka/letsencrypt/)

[![](https://images.microbadger.com/badges/image/nouchka/letsencrypt.svg)](https://microbadger.com/images/nouchka/letsencrypt "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/nouchka/letsencrypt.svg)](https://microbadger.com/images/nouchka/letsencrypt "Get your own version badge on microbadger.com")
[![Docker Automated buil](https://img.shields.io/docker/automated/nouchka/letsencrypt.svg)](https://hub.docker.com/r/nouchka/letsencrypt/)

# Usage (deprecated branch apache, docker tag latest to avoid breaking current)

Based on docker image lojzik/dockerfile-letsencrypt which provides certbot.
Check in docker-compose.yml for a working example, just complete haproxy conf file.
You have to specify a list of domains, certbot will generate files to validate domain.
Lighhtpd will provide theses files.
Haproxy will have a txt file with the list of ssl certificates to use.
Haproxy has to route traffic to lighttpd for url starting with /.well-known

# Usage (branch master, docker tag cloudflare)

cp env.template .env
change email, api token and domain
make run
Haproxy will have a txt file with the list of ssl certificates to use.

# Donate

Bitcoin Address: 15NVMBpZJTvkefwfsMAFA3YhyiJ5D2zd3R
