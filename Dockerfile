FROM ubuntu:20.04

#Set environment variable to avoid interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y git apt-utils curl unzip python3.9 python3.9-dev python3-pip && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1 && \
    useradd -ms /bin/bash -d /home/rcx rcx && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && rm get-pip.py && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && ./aws/install && \
    pip3 install virtualenv

CMD ["python3"]

