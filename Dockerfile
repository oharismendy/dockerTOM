### set the base image to Ubuntu
FROM ubuntu:16.04

### File author / maintainer
MAINTAINER Olivier Harismendy "oharismendy@ucsd.edu"

### change a working directory to /opt #######
WORKDIR /opt

### install
RUN apt-get update

RUN apt-get install -y  autoconf vim python-pip python-dev cmake build-essential \
  git g++ libncurses5-dev \
 libssl-dev make pkg-config software-properties-common python wget zip zlibc \
 zlib1g zlib1g-dev

RUN apt-get install -y samtools

RUN pip install variant_tools

RUN apt-get install -y bedtools

RUN apt-get install -y vcftools

RUN git clone https://github.com/lh3/bwa.git && \
	cd bwa && \
	make
  cp bwa /usr/bin

WORKDIR /opt

RUN git clone --recursive https://github.com/vcflib/vcflib.git && \
	cd vcflib && \
	make
  cp bin/* /usr/bin

RUN chmod a+x /usr/local/bin/*

RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 ubuntu

USER ubuntu

CMD ["/bin/bash"]
