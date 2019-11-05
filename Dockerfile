FROM ubuntu:latest as check-crlf

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
