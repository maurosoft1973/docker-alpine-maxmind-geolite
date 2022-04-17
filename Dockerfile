ARG DOCKER_ALPINE_VERSION

FROM maurosoft1973/alpine:$DOCKER_ALPINE_VERSION as builder

RUN \
    apk add --update --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community \
    go && \
    rm -rf /tmp/* /var/cache/apk/*

RUN mkdir /build
ADD ./src/ /build/

WORKDIR /build 

RUN go build -o main .

ARG DOCKER_ALPINE_VERSION

FROM maurosoft1973/alpine:$DOCKER_ALPINE_VERSION

ARG BUILD_DATE
ARG ALPINE_ARCHITECTURE
ARG ALPINE_RELEASE
ARG ALPINE_VERSION
ARG ALPINE_VERSION_DATE
ARG MAXMIND_GEOLITE_VERSION
ARG MAXMIND_GEOLITE_VERSION_DATE

LABEL \
    maintainer="Mauro Cardillo <mauro.cardillo@gmail.com>" \
    architecture="$ALPINE_ARCHITECTURE" \
    maxmind-geolite-version="$MAXMIND_GEOLITE_VERSION" \
    alpine-version="$ALPINE_VERSION" \
    build="$BUILD_DATE" \
    org.opencontainers.image.title="alpine-maxmind-geolite" \
    org.opencontainers.image.description="MaxMind Geolite Docker image running on Alpine Linux" \
    org.opencontainers.image.authors="Mauro Cardillo <mauro.cardillo@gmail.com>" \
    org.opencontainers.image.vendor="Mauro Cardillo" \
    org.opencontainers.image.version="v$MAXMIND_GEOLITE_VERSION" \
    org.opencontainers.image.url="https://hub.docker.com/r/maurosoft1973/alpine-maxmind-geolite/" \
    org.opencontainers.image.source="https://gitlab.com/maurosoft1973-docker/alpine-maxmind-geolite" \
    org.opencontainers.image.created=$BUILD_DATE

COPY --from=builder /build/main /var/www/
COPY --from=builder /build/db.mmdb /var/www/

ADD files/run-alpine-maxmind-geolite.sh /scripts/run-alpine-maxmind-geolite.sh
RUN chmod +x /scripts/run-alpine-maxmind-geolite.sh

WORKDIR /var/www

ENTRYPOINT ["/scripts/run-alpine-maxmind-geolite.sh"]