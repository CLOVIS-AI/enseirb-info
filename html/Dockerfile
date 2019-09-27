FROM alpine:latest
MAINTAINER Ivan Canet <ivancanet+foss@gmail.com>

RUN apk update \
 && apk add --no-cache ca-certificates openssl \
 && update-ca-certificates \
 && apk add --no-cache wget
