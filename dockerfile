# set base image (host OS)
FROM python:3.8

# make sure all sources are up to date
RUN apt-get update -y 

# install system libraries
RUN apt-get install -y libx11-xcb1  &&\
    apt-get install -y libxtst6  && \
    apt-get install -y libxrandr2  && \
    apt-get install -y libasound2  && \
    apt-get install -y libpangocairo-1.0-0  && \
    apt-get install -y libatk1.0-0  && \
    apt-get install -y libatk-bridge2.0-0  && \
    apt-get install -y libgtk-3-0  && \
    apt-get install -y libnss3  && \
    apt-get install -y libxss1  

# # install chromeium
# RUN apt-get update && apt-get install -y \
#     apt-transport-https \
#     ca-certificates \
#     curl \
#     gnupg \
#     --no-install-recommends \
#     && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
#     && echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
#     && apt-get update && apt-get install -y \
#     google-chrome-stable \
#     --no-install-recommends

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

# install pdf export dependencies
RUN apt-get install -y pandoc
RUN apt-get install -y texlive-xetex

# install and activate nbextensions
RUN jupyter contrib nbextension install && \
    jupyter nbextension enable toc2/main && \
    jupyter nbextension enable spellchecker/main && \
    jupyter nbextension enable code_prettify/autopep8 && \
    jupyter nbextension enable --py widgetsnbextension

