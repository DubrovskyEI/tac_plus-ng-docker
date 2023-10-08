FROM ubuntu:22.04

# Copy source files into /opt/tac_plus-ng
COPY event-driven-servers/ /opt/tac_plus-ng

# Set the working directory to /opt/tac_plus-ng
WORKDIR /opt/tac_plus-ng

# Install required system packages and tac_plus-ng
RUN apt update && \
    apt install -y build-essential && \
    apt install -y libnet-ldap-perl && \ 
    apt install -y libpcre2-dev && \
    apt install -y libc-ares-dev && \
    ./configure && make && make install

# Expose tac_plus-ng port (49/tcp) to the world
EXPOSE 49/tcp

# Run tac_plus-ng
CMD /usr/local/sbin/tac_plus-ng -f /usr/local/etc/tac_plus-ng.cfg
