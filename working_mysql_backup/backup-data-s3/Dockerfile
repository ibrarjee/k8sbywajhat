FROM alpine:latest

RUN apk --no-cache add python3 py3-pip bash

RUN  pip3 install --upgrade pip \
    && pip3 install --no-cache-dir awscli
USER root
COPY backup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/backup.sh
ENTRYPOINT ["/usr/local/bin/backup.sh"]