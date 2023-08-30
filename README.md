# docker-python-3.9
## This image provides Python 3.9 and AWS CLI 2. Users can run their own commands when using this image.
```
docker build -t vijay2181/vijay-python-3.9:latest .
docker login
docker push vijay2181/vijay-python-3.9:latest
docker pull vijay2181/vijay-python-3.9:latest
docker run -it --rm vijay2181/vijay-python-3.9:latest python3.9 --version
```
