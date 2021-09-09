FROM alpine:3.14

RUN apk add --no-cache alpine-sdk

WORKDIR /root

COPY . .

RUN make install && rm *
