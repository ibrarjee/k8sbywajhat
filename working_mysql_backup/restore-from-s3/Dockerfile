FROM alpine:latest

RUN apk --no-cache add python3 py3-pip bash

RUN  pip3 install --upgrade pip \
    && pip3 install --no-cache-dir awscli
USER root
COPY restore.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/restore.sh
ENTRYPOINT ["/usr/local/bin/restore.sh"]

