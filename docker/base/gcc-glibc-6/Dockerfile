FROM mattiapenati/mk:toolchain--gcc-glibc-6 AS build

# Bootstrap mk
USER root
RUN apk update && \
    apk add bison gettext make mercurial openssl perl

USER swadmin
WORKDIR /home/swadmin
RUN hg clone https://mattiapenati@bitbucket.org/mattiapenati/mk && \
    cd mk/base && \
    source /u/sw/etc/profile.d/mk.sh && \
    module load gcc-glibc/6 && \
    mkFlags=-v make install && \
    cd -

# Copying the mk tree
FROM mattiapenati/mk:empty
COPY --from=build --chown=swadmin:swadmin /u/sw /u/sw
USER docker
WORKDIR /home/docker
ENTRYPOINT /u/sw/bin/bash
