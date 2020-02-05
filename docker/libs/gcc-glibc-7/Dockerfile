FROM mattiapenati/mk:base--gcc-glibc-7 AS build

# Bootstrap mk
USER root
RUN apk update && \
    apk add gettext mercurial python

USER swadmin
WORKDIR /home/swadmin
RUN hg clone https://mattiapenati@bitbucket.org/mattiapenati/mk && \
    cd mk/pkgs && \
    source /u/sw/etc/profile.d/mk.sh && \
    module load gcc-glibc/7 && \
    mkFlags=-v make libs && \
    cd -

# Copying the mk tree
FROM mattiapenati/mk:empty
COPY --from=build --chown=swadmin:swadmin /u/sw /u/sw
RUN echo "module load gcc-glibc" >> /home/docker/.bashrc
USER docker
WORKDIR /home/docker
ENTRYPOINT /u/sw/bin/bash
