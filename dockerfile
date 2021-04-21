# set base image (host OS)
FROM python:3.8

# make sure all sources are up to date
RUN apt-get update -y 

# install system libraries

RUN apt-get install libx11-xcb1 -y &&\
    apt-get install libxtst6 -y && \
    apt-get install libxrandr2 -y && \
    apt-get install libasound2 -y && \
    apt-get install libpangocairo-1.0-0 -y && \
    apt-get install libatk1.0-0 -y && \
    apt-get install libatk-bridge2.0-0 -y && \
    apt-get install libgtk-3-0 -y && \
    apt-get install libnss3 -y && \
    apt-get install libxss1 -y 

# upgrade pip
RUN pip install --no-cache --upgrade pip 

# copy dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# notebook setup ------------------

# install notebook widgets
RUN pip install ipywidgets

# install auto formatter 
RUN pip install autopep8

# install and activate nbextensions
RUN jupyter contrib nbextension install && \
    jupyter nbextension enable toc2/main && \
    jupyter nbextension enable spellchecker/main && \
    jupyter nbextension enable code_prettify/autopep8 && \
    jupyter nbextension enable --py widgetsnbextension

