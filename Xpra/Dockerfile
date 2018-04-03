FROM ubuntu:xenial
MAINTAINER Takao Sumitomo
LABEL OBJECT="Xpra"

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install xpra

RUN chmod g=u /etc/passwd
RUN echo "#!/bin/sh" > /uid_entrypoint \
  && echo 'echo "${USERNAME:-default}:x:$(id -u):0:${USERNAME:-default},,,:/host_home:/bin/bash" >> /etc/passwd' >> /uid_entrypoint \
  && echo '/usr/bin/xpra_launcher $@' >> /uid_entrypoint

RUN chmod 755 /uid_entrypoint

ENTRYPOINT [ "/uid_entrypoint" ]

# ENTRYPOINT ["/usr/bin/xpra"]
