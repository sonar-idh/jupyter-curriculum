# set base image (host OS)
FROM python:3.8

# make sure all sources are up to date
RUN apt-get update -y 

# upgrade pip
RUN pip install --no-cache --upgrade pip 

# copy dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# install latex & pandoc
RUN apt-get install pandoc -y && \
    apt-get install texlive-xetex texlive-fonts-recommended texlive-generic-recommended -y


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

