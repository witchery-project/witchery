FROM alpine:3.14

WORKDIR /root

COPY . .

RUN apk add --no-cache alpine-sdk && make install && rm -rf *
