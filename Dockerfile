### set the base image to Ubuntu
FROM ubuntu:16.04

### File author / maintainer
MAINTAINER Olivier Harismendy "oharismendy@ucsd.edu"

### change a working directory to /opt #######
WORKDIR /opt

### install 
RUN apt-get update

RUN apt-get install -y git
 
RUN git clone https://github.com/lh3/bwa.git && \
	cd bwa && \
	make 

RUN apt-get install -y samtools

