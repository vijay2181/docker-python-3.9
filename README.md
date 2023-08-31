# Docker image for python3.9

```
The above Dockerfile has ubuntu20.04, python3.9.5, awscli2, virtual environment versions.
by default docker will login as root user, so as a good practice install all tools with root user
and then create a non-root user and run application
```

```
# Add user
RUN useradd -ms /bin/bash -d /home/vijay vijay && \
    chown -R vijay /home/vijay && \
    adduser vijay sudo && \
    echo 'vijay ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#switch to user
USER vijay

# Copy the rest of the application code into the container at /rcx
COPY . /home/vijay/

WORKDIR /home/vijay
```

```
docker build -t vijay2181/vijay-python-3.9:latest .
docker login
docker push vijay2181/vijay-python-3.9:latest
docker pull vijay2181/vijay-python-3.9:latest
docker run -it --rm vijay2181/vijay-python-3.9:latest python3.9 --version
```
