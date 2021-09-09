# Witchery can also build distroless containers for Alpine packages, for example,
# wget.
FROM kaniini/witchery:latest AS witchery

# Use witchery-compose to generate an image.
RUN witchery-compose -d wget -d ca-certificates-bundle -k /etc/apk/keys -X http://dl-cdn.alpinelinux.org/alpine/v3.14/main /root/outimg/

# Copy the generated image to a new one.
FROM kaniini/witchery-base:latest
CMD ["/usr/bin/wget"]
COPY --from=witchery /root/outimg/ .
