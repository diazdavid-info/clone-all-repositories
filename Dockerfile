FROM alpine:3.13.4

ENV USER_NAME=example@example.org
ENV USER_PASS=example
ENV BITBUCKET_ORGANIZATION=example

RUN apk add --update curl jq git bash openssh tzdata && rm -rf /var/cache/apk/*
RUN cp /usr/share/zoneinfo/Europe/Madrid /etc/localtime

RUN mkdir -p /opt/workspace

WORKDIR /opt/workspace
COPY ./src/bitbucket.sh /bin/bitbucket

RUN chmod +x /bin/bitbucket

CMD ["/bin/bash"]