# set base image (host OS)
FROM python:3.8

# install curl for nodejs and npm
RUN apt-get update -y && \
    apt-get install curl -y

# install nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
RUN apt-get install nodejs

# upgrade pip
RUN pip install --no-cache --upgrade pip 

# copy the dependencies file to the working directory
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
    jupyter nbextension enable exercise2/main && \
    jupyter nbextension enable spellchecker/main && \
    jupyter nbextension enable scratchpad/main && \
    jupyter nbextension enable code_prettify/autopep8 && \
    jupyter nbextension enable rubberband/main && \
    jupyter nbextension enable --py widgetsnbextension

# install citation extension
RUN pip install 'cite2c==0.2.1' && \
    python -m cite2c.install
