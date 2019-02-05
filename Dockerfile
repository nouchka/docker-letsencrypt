FROM certbot/certbot:v0.24.0
LABEL maintainer="Jean-Avit Promis docker@katagena.com"
LABEL org.label-schema.vcs-url="https://github.com/nouchka/docker-letsencrypt"


ENV VERSION=0.24.0

COPY start.sh /start.sh

RUN chmod +x /start.sh && \
    apk add --no-cache --virtual .build-deps \
        git \
        linux-headers \
        openssl-dev \
        musl-dev \
        libffi-dev \
    && git clone https://github.com/certbot/certbot.git /tmp/certbot \
    && cd /tmp/certbot && git checkout tags/v${VERSION} \
    && cp -Rf /tmp/certbot/certbot-dns-cloudflare/ /opt/certbot/src/certbot-dns-cloudflare/ \
    && pip install --no-cache-dir \
        --upgrade setuptools \
        -e /opt/certbot/src/certbot-dns-cloudflare \
	&& apk del .build-deps \
	&& rm -rf /tmp/certbot/

ENTRYPOINT /start.sh
