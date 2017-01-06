FROM centos:7.1


# update source from yum
RUN yum update

RUN yum install uuid-devel libuuid libuuid-devel uuid \
boost-devel libevent libevent-devel boost boost-devel \
gcc-c++ mysql-libs mysql libmemcached-devel libmemcached \
make curl libcurl-devel mysql-devel gperf

RUN cd /usr/local/src
ENV GEARMAN_VERSION 1.1.14
# isntall gearmand
RUN wget http://launchpad.net/gearmand/1.2/$GEARMAN_VERSION/+download/gearmand-$GEARMAN_VERSION.tar.gz

RUN tar zxvf gearmand-$GEARMAN_VERSION.tar.gz && cd gearmand-$GEARMAN_VERSION.tar.gz
RUN ./configure
RUN make && make install

CMD ['gearmand -d']

