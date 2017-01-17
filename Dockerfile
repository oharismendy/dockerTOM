### set the base image to Ubuntu
FROM ubuntu:16.04

### File author / maintainer
MAINTAINER Olivier Harismendy "oharismendy@ucsd.edu"

### change a working directory to /opt #######
WORKDIR /opt

### install
RUN  apt-get update && apt-get install -y  \
autoconf \
build-essential \
curl \
git \
g++ \
libncurses5-dev \
libssl-dev \
libboost-all-dev \
libbz2-dev \
make \
man \
pkg-config \
python \
python-pip \
python-dev \
software-properties-common \
screen \
vim \
wget \
zip \
zlibc \
zlib1g \
zlib1g-dev

RUN wget https://github.com/samtools/htslib/releases/download/1.3.2/htslib-1.3.2.tar.bz2 && \
	tar -xjvf htslib-1.3.2.tar.bz2 && \
	cd htslib-1.3.2 && \
	make && \
	make install 

RUN wget https://github.com/samtools/samtools/releases/download/1.3.1/samtools-1.3.1.tar.bz2 && \
	tar -xjvf samtools-1.3.1.tar.bz2 && \
	cd samtools-1.3.1 && \
	make && \
	make install 

RUN wget https://github.com/samtools/bcftools/releases/download/1.3.1/bcftools-1.3.1.tar.bz2 && \
	tar -xjvf bcftools-1.3.1.tar.bz2 && \
	cd bcftools-1.3.1 && \
	make && \
	make install 
	
	
RUN wget https://github.com/arq5x/bedtools2/releases/download/v2.26.0/bedtools-2.26.0.tar.gz && \
	tar -xvzf bedtools-2.26.0.tar.gz && \
	cd bedtools2 && \
	make && \
	cp bin/* /usr/local/bin 

RUN wget https://github.com/vcftools/vcftools/releases/download/v0.1.14/vcftools-0.1.14.tar.gz && \
	tar -xjvf vcftools-0.1.14.tar.bz2 && \
	cd vcftools-0.1.14 && \
	make && \
	make install 	

RUN pip install --upgrade pip && \
    pip install variant_tools


RUN wget https://sourceforge.net/projects/bio-bwa/files/bwa-0.7.15.tar.bz2 && \
	tar -xjvf bwa-0.7.15.tar.bz2 && \
	cd bwa-0.7.15 && \
	make && \
	make install 
	

RUN git clone --recursive https://github.com/vcflib/vcflib.git && \
	cd vcflib && \
	make &&\
  cp bin/* /usr/local/bin

WORKDIR /opt

RUN chmod a+x /usr/local/bin/* 

RUN groupadd -r -g 1000 ubuntu && useradd -r -g ubuntu -u 1000 ubuntu

WORKDIR /home/ubuntu

CMD ["/bin/bash"]
