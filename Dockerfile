#
# hashcat Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

ENV HASHCAT_VERSION v4.2.1

# Update & install packages for installing hashcat
RUN apt-get update && \
    apt-get install -y wget gcc make opencl-headers

#Install and configure hashcat
RUN mkdir hashcat && \
    cd hashcat && \
    wget https://api.github.com/repos/hashcat/hashcat/tarball/${HASHCAT_VERSION} -O ${HASHCAT_VERSION}.tar.gz && \
    tar xf  ${HASHCAT_VERSION}.tar.gz --strip-components=1

WORKDIR /hashcat

#Install
RUN make install

#Add link for binary
#RUN ln -s /hashcat/hashcat /usr/bin/hashcat

#CMD ["/bin/bash""]
