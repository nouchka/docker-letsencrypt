# letsencrypt

[![Docker Hub repository](http://dockeri.co/image/nouchka/letsencrypt)](https://registry.hub.docker.com/u/nouchka/letsencrypt/)

[![](https://images.microbadger.com/badges/image/nouchka/letsencrypt.svg)](https://microbadger.com/images/nouchka/letsencrypt "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/nouchka/letsencrypt.svg)](https://microbadger.com/images/nouchka/letsencrypt "Get your own version badge on microbadger.com")
[![Docker Automated buil](https://img.shields.io/docker/automated/nouchka/letsencrypt.svg)](https://hub.docker.com/r/nouchka/letsencrypt/)

# Usage

Based on docker image lojzik/dockerfile-letsencrypt which provides certbot.
Check in docker-compose.yml for a working example, just complete haproxy conf file.
You have to specify a list of domains, certbot will generate files to validate domain.
Lighhtpd will provide theses files.
Haproxy will have a txt file with the list of ssl certificates to use.
Haproxy has to route traffic to lighttpd for url starting with /.well-known

# Todo

* launch lighhtpd only during certbot generation
* switch to docker-compose v3
* switch to haproxy swarm mode

# Donate

Bitcoin Address: 15NVMBpZJTvkefwfsMAFA3YhyiJ5D2zd3R
