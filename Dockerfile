FROM ubuntu:16.04
MAINTAINER Pawvlovicky <Pawlovicky@google.com>

RUN apt-get update && \
    apt-get install -y python3.5 \
    python3-pip \
    python3-dev \
    python3-tk \
    wget \
    unzip

RUN pip3 install --upgrade pip

RUN pip install \
    tensorflow \
    regex \
    nltk \
    tqdm \
    jupyter \
    scikit-learn \
    scipy \
    matplotlib \
    pandas

RUN pip install pycallgraph

RUN pip install -q -U tensor2tensor

RUN apt-get install -y libwww-perl\
    curl\
    python

RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

RUN mkdir -p /usr/local/gcloud
RUN tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz
RUN /usr/local/gcloud/google-cloud-sdk/install.sh --quiet
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

WORKDIR /work

RUN useradd docker -u 1001 -s /bin/bash -m
USER docker

ENTRYPOINT ["/bin/bash"]
