### set the base image to Ubuntu
FROM ubuntu:16.04

### File author / maintainer
MAINTAINER Olivier Harismendy "oharismendy@ucsd.edu"

### change a working directory to /opt #######
WORKDIR /opt

### install 
RUN apt-get update

RUN apt-get install -y  autoconf python-pip python-dev build-essential git g++ libncurses5-dev \
 libssl-dev make pkg-config software-properties-common python wget zip zlibc \
 zlib1g zlib1g-dev

RUN apt-get install -y samtools

RUN git clone https://github.com/lh3/bwa.git && \
	cd bwa && \
	make && \
	cp bwa /usr/bin
	
RUN apt-get install -y bedtools

RUN apt-get install -y vcftools

RUN git clone --recursive https://github.com/vcflib/vcflib.git && \
	cd vcflib && \
	make && \
	cp bin/* /usr/bin
	
##RUN pip install variant_tools






