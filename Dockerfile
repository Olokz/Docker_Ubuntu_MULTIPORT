FROM ubuntu:14.04

MAINTAINER Olokz "https://github.com/Olokz"

ENV ROOT_PASS=CHANGEME \
    PORT_SSH="22" \
    PORT_1="21" \
    PORT_2="20" \
    PORT_3="80" \
    PORT_4="443" \
    PORT_5="587" \
    PORT_6="8443" \
    PORT_7="2243" \
    PORT_8="7070" \
    PORT_9="8547" \
    PORT_10="9987"

RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo "$ROOT_PASS" | passwd --stdin root

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE $PORT_SSH
EXPOSE $PORT_1
EXPOSE $PORT_2
EXPOSE $PORT_3
EXPOSE $PORT_4
EXPOSE $PORT_5
EXPOSE $PORT_6
EXPOSE $PORT_7
EXPOSE $PORT_8
EXPOSE $PORT_9
EXPOSE $PORT_10

CMD    ["/usr/sbin/sshd", "-D"]
