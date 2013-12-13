FROM centos

RUN yum groupinstall -y "development tools" && yum install -y wget tar && yum clean all

ENV CFLAGS -O2 -fPIC
ENV CXXFLAGS -O2 -fPIC

ENV GMPVERSION 6.0.0
RUN wget https://ftp.gnu.org/gnu/gmp/gmp-${GMPVERSION}a.tar.bz2 
RUN tar xf gmp-${GMPVERSION}a.tar.bz2
RUN cd gmp-${GMPVERSION} && ./configure --prefix=/usr --libdir=/usr/lib64
RUN cd gmp-${GMPVERSION} && make
RUN cd gmp-${GMPVERSION} && make install

ENV MPFRVERSION 3.1.2
RUN wget http://www.mpfr.org/mpfr-current/mpfr-${MPFRVERSION}.tar.bz2
RUN tar xf mpfr-${MPFRVERSION}.tar.bz2
RUN cd mpfr-${MPFRVERSION} && ./configure --prefix=/usr --libdir=/usr/lib64
RUN cd mpfr-${MPFRVERSION} && make
RUN cd mpfr-${MPFRVERSION} && make install

ENV MPCVERSION 1.0.2
RUN wget ftp://ftp.gnu.org/gnu/mpc/mpc-${MPCVERSION}.tar.gz
RUN tar xf mpc-${MPCVERSION}.tar.gz
RUN cd mpc-${MPCVERSION} && ./configure --prefix=/usr --libdir=/usr/lib64
RUN cd mpc-${MPCVERSION} && make
RUN cd mpc-${MPCVERSION} && make install

ENV GCCVERSION 4.9.2
RUN wget http://mirrors.concertpass.com/gcc/releases/gcc-${GCCVERSION}/gcc-${GCCVERSION}.tar.bz2
RUN tar xf gcc-${GCCVERSION}.tar.bz2
RUN cd gcc-${GCCVERSION} && ./configure --prefix=/usr --libdir=/usr/lib64 --disable-bootstrap --program-suffix=49 --disable-multilib --enable-languages=c,c++,go
RUN cd gcc-${GCCVERSION} && make -j4
RUN cd gcc-${GCCVERSION} && make install
RUN ln -sf /usr/bin/gccgo49 /usr/bin/gccgo

ENV GOVERSION 1.2.2
RUN wget https://storage.googleapis.com/golang/go${GOVERSION}.linux-amd64.tar.gz
RUN tar xf go${GOVERSION}.linux-amd64.tar.gz
ENV GOROOT /go
ENV PATH ${GOROOT}bin:${PATH}

CMD bash -l

