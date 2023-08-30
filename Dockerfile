# Use the Ubuntu base image
FROM ubuntu:20.04

# Install required packages
RUN apt update -y && \
    apt install -y sudo wget unzip git apt-utils build-essential libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev \
    libreadline-dev libsqlite3-dev libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev \
    liblzma-dev libffi-dev wget curl && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Download Python source code and compile Configure, build, install Python
RUN wget https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tar.xz && \
    tar -xf Python-3.9.16.tar.xz && \
    cd Python-3.9.16 && \
    ./configure --enable-optimizations && \
    make -j $(nproc) && \
    make altinstall && \
    # Clean up
    cd / && rm -rf /Python-3.9.16 && \
    rm Python-3.9.16.tar.xz

# Install pip for Python 3.9.16 and awscli 2
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.9 - && \
    # Update python3 symbolic link
    update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.9 1 && \
    # Install virtualenv
    pip3 install virtualenv && \
    #install aws cli 2
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install
