FROM maurosoft1973/alpine as builder
RUN \
    apk add --update --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    go && \
    rm -rf /tmp/* /var/cache/apk/*
RUN mkdir /build 
ADD . /build/
WORKDIR /build 
RUN go build -o main .

FROM maurosoft1973/alpine
ARG BUILD_DATE
LABEL \
    maintainer="Mauro Cardillo <mauro.cardillo@gmail.com>" \
    architecture="amd64/x86_64" \
    alpine-version="3.12.0" \
    build="$BUILD_DATE" \
    org.opencontainers.image.title="alpine-maxmind-geolite" \
    org.opencontainers.image.description="MAXMind GeoLite Docker image running on Alpine Linux" \
    org.opencontainers.image.authors="Mauro Cardillo <mauro.cardillo@gmail.com>" \
    org.opencontainers.image.vendor="Mauro Cardillo" \
    org.opencontainers.image.version="v1.0.0" \
    org.opencontainers.image.url="https://hub.docker.com/r/maurosoft1973/alpine-maxmind-geolite/" \
    org.opencontainers.image.source="https://github.com/maurosoft1973/alpine-maxmind-geolite" \
    org.opencontainers.image.created=$BUILD_DATE

COPY --from=builder /build/main /var/www/
COPY --from=builder /build/db.mmdb /var/www/

ADD files/run-alpine-maxmind-geolite.sh /scripts/run-alpine-maxmind-geolite.sh
RUN chmod +x /scripts/run-alpine-maxmind-geolite.sh

WORKDIR /var/www

ENTRYPOINT ["/scripts/run-alpine-maxmind-geolite.sh"]
