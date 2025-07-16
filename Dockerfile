FROM debian:bookworm-slim

COPY entrypoint.sh /

RUN apt-get update \
  && apt-get install -y file \
  && rm -rf /var/lib/apt/lists/* \
  && chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
