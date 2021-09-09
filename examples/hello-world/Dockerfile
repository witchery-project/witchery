# Set up our build environment to compile our application.
FROM alpine:3.14 AS build
WORKDIR /root
COPY . .
RUN apk add --no-cache build-base && gcc -o hello-world hello-world.c

# Set up witchery as an intermediary step.
FROM kaniini/witchery:latest AS witchery

# abuild cannot run as root, so we build our payload APK under a non-root user.
RUN adduser -D builder && addgroup builder abuild
USER builder
WORKDIR /home/builder

COPY --from=build /root/hello-world .
RUN mkdir -p payloadfs/app && mv hello-world payloadfs/app/hello-world
RUN abuild-keygen -na && fakeroot witchery-buildapk -n payload payloadfs/ payloadout/

USER root
WORKDIR /root

# Add the witchery signing key to /etc/apk/keys.
RUN cp /home/builder/.abuild/*.pub /etc/apk/keys

# Use witchery-compose to generate an image.
RUN witchery-compose -p ~builder/payloadout/payload*.apk -k /etc/apk/keys -X http://dl-cdn.alpinelinux.org/alpine/v3.14/main /root/outimg/

# Copy the generated image to a new one.
FROM kaniini/witchery-base:latest
CMD ["/app/hello-world"]
COPY --from=witchery /root/outimg/ .
