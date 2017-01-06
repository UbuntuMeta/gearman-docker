FROM centos:centos7


# update source from yum
RUN yum -y update || exit 1;

RUN yum install -y uuid-devel libuuid libuuid-devel uuid \
boost-devel libevent libevent-devel boost boost-devel \
gcc-c++ mysql-libs mysql libmemcached-devel libmemcached \
make curl libcurl-devel mysql-devel gperf

RUN cd /usr/local/src
ENV GEARMAN_VERSION 1.1.14
# isntall gearmand
RUN wget https://github.com/gearman/gearmand/releases/download/$GEARMAN_VERSION/gearmand-$GEARMAN_VERSION.tar.gz
RUN tar zxvf gearmand-$GEARMAN_VERSION.tar.gz && cd gearmand-$GEARMAN_VERSION.tar.gz
RUN ./configure
RUN make && make install

CMD ['gearmand -d']

