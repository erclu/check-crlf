FROM ubuntu:latest as check-crlf

WORKDIR /app
COPY entrypoint.sh /

RUN  apt-get update && apt-get install -y  file

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
