FROM mattiapenati/mk:empty AS build

# Bootstrap mk
USER root
RUN apk update && \
    apk add bash bison clang g++ gawk gcc gettext-dev m4 make mercurial \
            musl-dev openssl texinfo

USER swadmin
WORKDIR /home/swadmin
RUN hg clone https://mattiapenati@bitbucket.org/mattiapenati/mk && \
    cd mk/toolchains/gcc-glibc && \
    source /u/sw/etc/profile.d/mk.sh && \
    /u/sw/sbin/mkpkg -v --options=5 && \
    cd -

# Copying the mk tree
FROM mattiapenati/mk:empty
COPY --from=build --chown=swadmin:swadmin /u/sw /u/sw
USER docker
WORKDIR /home/docker
ENTRYPOINT /u/sw/bin/bash
