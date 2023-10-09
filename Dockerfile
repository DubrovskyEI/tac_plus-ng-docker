FROM ubuntu as build

# Copy source files into /opt/tac_plus-ng
COPY event-driven-servers/ /opt/tac_plus-ng

# Change to /opt/tac_plus-ng
WORKDIR /opt/tac_plus-ng

# Install required system packages and tac_plus=ng
RUN apt update && \
    apt install -y build-essential && \
    apt install -y libnet-ldap-perl && \ 
    apt install -y libpcre2-dev && \
    apt install -y libc-ares-dev && \
    apt install -y checkinstall && \
    ./configure && make && \
    checkinstall --install=no --default --pkgname=tac-plus-ng --pkgversion=1 && \
    cp tac-plus-ng_*.deb /tac-plus-ng.deb

FROM ubuntu as main

COPY --from=build /tac-plus-ng.deb /

RUN apt update && \
    apt install -y libnet-ldap-perl && \
    apt install -y libpcre2-dev && \
    apt install -y libc-ares-dev && \ 
    dpkg -i /tac-plus-ng.deb && \
    rm /tac-plus-ng.deb

# Expose tacacs port to the world
EXPOSE 49/tcp

# Run tacacs
CMD /usr/local/sbin/tac_plus-ng -f /usr/local/etc/tac_plus-ng.cfg
