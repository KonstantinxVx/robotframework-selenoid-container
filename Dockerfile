FROM ubuntu:16.04

RUN apt-get update \
      && apt-get install --quiet --assume-yes python3-pip unzip firefox wget less xvfb git

COPY ./requirements.txt /tmp
RUN pip3 install -r /tmp/requirements.txt

RUN curl -s https://aerokube.com/cm/bash | bash \
    && ./cm selenoid start --vnc --tmpfs 128

RUN apt-get autoclean