FROM ubuntu:16.04
MAINTAINER Tom Kocmi <kocmi@ufal.mff.cuni.cz>

RUN apt-get update && apt-get install -y \
	cmake \
	git \
	python \
	python3 \
	vim \
	python-dev \
	python-pip

RUN pip install --upgrade pip

RUN pip install numpy numexpr cython theano ipdb

RUN mkdir -p /path/to
WORKDIR /path/to/

# Install mosesdecoder
RUN git clone https://github.com/moses-smt/mosesdecoder
#WORKDIR /mosesdecoder

# Install subwords
RUN git clone https://github.com/rsennrich/subword-nmt

# Install nematus
RUN git clone https://github.com/rsennrich/nematus.git
WORKDIR /path/to/nematus
RUN python setup.py install

WORKDIR /

# playground will contain user defined scripts, it should be run as:
# docker run -v `pwd`:/playground -it nematus-docker
RUN mkdir playground
WORKDIR /playground

