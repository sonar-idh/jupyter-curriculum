# set base image (host OS)
FROM python:3.8

# install curl for nodejs and npm
RUN apt-get update && \
    apt-get install curl 

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install nodejs

# install the notebook package
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache jupyterlab

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

