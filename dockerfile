# set base image (host OS)
FROM python:3.8

# install the notebook package
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache jupyterlab

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

