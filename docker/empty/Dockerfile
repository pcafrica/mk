FROM alpine:latest AS build

# Bootstrap mk
USER root
RUN addgroup swadmin && \
    adduser -D -s /bin/ash -g "Software administrator" -G swadmin swadmin && \
    apk update && \
    apk add bash bison clang gcc make mercurial musl-dev && \
    install -d -o root -g root /u && \
    install -d -o swadmin -g swadmin /u/sw

USER swadmin
WORKDIR /home/swadmin
RUN hg clone https://mattiapenati@bitbucket.org/mattiapenati/mk && \
    cd mk/bootstrap && \
    CC=clang ./bootstrap /u/sw
COPY mk.config /u/sw/etc/mk.config

# Copying the mk tree
FROM alpine:latest
RUN addgroup swadmin && \
    adduser -D -s /u/sw/bin/bash -g "Software administrator" -G swadmin swadmin && \
    addgroup docker && \
    adduser -D -s /u/sw/bin/bash -g "Default login" -G docker docker
COPY --from=build --chown=swadmin:swadmin /u/sw /u/sw
USER docker
WORKDIR /home/docker
ENTRYPOINT /u/sw/bin/bash
