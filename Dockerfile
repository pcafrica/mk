# Build with:
# docker build -t mk_build . --squash
#
# Retrieve build files with:
#   docker run -it mk_build
# then open a new terminal:
#   docker container list
#   docker cp <container_id>:/mk/mk-2022.0-toolchain.tar.gz .
#   docker cp <container_id>:/mk/mk-2022.0-base.tar.gz .
#   docker cp <container_id>:/mk/mk-2022.0-lifex.tar.gz .
#   docker cp <container_id>:/mk/mk-2022.0-pyfex.tar.gz .
#   docker cp <container_id>:/mk/mk-2022.0-full.tar.gz .


FROM debian:buster

MAINTAINER pasqualeclaudio.africa@polimi.it


# Define variables.
ENV HOME /root
ENV mkPrefix /u/sw

ENV mkRoot /mk
ENV mkOutputBasename "${mkRoot}/mk-2022.0"

ENV mkKeepBuildDir yes
ENV mkFlags "--jobs=6 -v"

ENV mkBashrc "${HOME}/.bashrc_mk"
ENV mkBashrcSource "source ${mkBashrc}"

# Install dependencies.
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y build-essential python2.7 python3 \
      gawk procps wget curl openssh-client p11-kit \
      git rsync zip unzip


# Clone repo.
RUN git clone https://github.com/elauksap/mk.git ${mkRoot}


# 1. Bootstrap.
WORKDIR ${mkRoot}
RUN bootstrap/bootstrap ${mkPrefix}


# 2. Toolchain.
WORKDIR ${mkRoot}/toolchains/gcc-glibc
RUN make install mkFlags="${mkFlags}"
RUN tar czvf ${mkOutputBasename}-toolchain.tar.gz ${mkPrefix}

# Enable toolchain by default.
# NB: the usual "${HOME}/.bashrc" would not get sourced
# when running non-interactively.

SHELL ["/bin/bash", "-c"]

RUN printf "\n# mk.\n\
source /u/sw/etc/profile\n\
module load gcc-glibc\n" >> ${mkBashrc}


# 3. Base.
WORKDIR ${mkRoot}/base
RUN ${mkBashrcSource} && make install mkFlags="${mkFlags}"
RUN tar czvf ${mkOutputBasename}-base.tar.gz ${mkPrefix}


# 4. Packages.
WORKDIR ${mkRoot}/pkgs
RUN ${mkBashrcSource} && make libs mkFlags="${mkFlags}"

RUN ${mkBashrcSource} && make lifex mkFlags="${mkFlags}"
RUN tar czvf ${mkOutputBasename}-lifex.tar.gz ${mkPrefix}

RUN ${mkBashrcSource} && make pyfex mkFlags="${mkFlags}"
RUN tar czvf ${mkOutputBasename}-pyfex.tar.gz ${mkPrefix}

RUN ${mkBashrcSource} && make extra mkFlags="${mkFlags}"
RUN tar czvf ${mkOutputBasename}-full.tar.gz ${mkPrefix}

# Set configuration variables.
USER root
WORKDIR ${HOME}
