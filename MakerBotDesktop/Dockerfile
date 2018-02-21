FROM ubuntu:xenial
MAINTAINER Takao Sumitomo
LABEL OBJECT="MakerBot Desktop"

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install software-properties-common wget
RUN apt-add-repository 'http://downloads.makerbot.com/makerware/ubuntu'
RUN add-apt-repository ppa:deadsnakes/ppa
RUN wget -q http://downloads.makerbot.com/makerware/ubuntu/dev@makerbot.com.gpg.key -O- | apt-key add -
RUN apt-get -y update
RUN apt-get -y install zlib1g gksu libthing zenity libmbqtutils libstdc++6 sliceconfig mbacceleration mb-libjsoncpp libboost-system1.58.0 libboost-filesystem1.58.0 libboost-date-time1.58.0 libboost-thread1.58.0
RUN mv /bin/systemctl /bin/systemctl.orig && ln -s /bin/true /bin/systemctl
RUN apt-get -y install makerware conveyor conveyor-ui
RUN apt-get -y install libopencv-calib3d2.4v5 libopencv-core2.4v5 libopencv-features2d2.4v5 libopencv-flann2.4v5 libopencv-highgui2.4v5 libopencv-imgproc2.4v5
RUN apt-get -y install libqt5opengl5
RUN apt-get -y install libqt5webkit5
RUN apt-get -y install libyajl2

RUN mkdir -p /opt/bin
RUN echo "#!/bin/sh" > /opt/bin/run-makerware.sh
RUN echo "/usr/bin/conveyor-svc --config /etc/conveyor.conf &" >> /opt/bin/run-makerware.sh
RUN echo "/usr/bin/makerware" >> /opt/bin/run-makerware.sh
RUN chmod +x /opt/bin/run-makerware.sh

ENTRYPOINT ["/opt/bin/run-makerware.sh"]
