FROM ubuntu:16.04

WORKDIR /app

RUN apt-get update
RUN apt-get install -y git build-essential cmake libuv1-dev libmicrohttpd-dev
RUN git clone https://github.com/xmrig/xmrig.git /app
RUN mkdir /app/build
RUN cmake .
RUN make

ENV POOL=stratum+tcp://xdn-xmr.pool.minergate.com:45790
ENV USER=pakokrew@gmail.com

ENTRYPOINT /app/xmrig -a cryptonight -o $POOL$ -u $USER$ -p x --print-time=10

