FROM alpine:3

COPY entrypoint.sh /

RUN apk update \
  && apk add file git bash \
  && rm -rf /var/lib/apt/lists/* \
  && chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
