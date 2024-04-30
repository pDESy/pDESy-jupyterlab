FROM python:3
USER root
WORKDIR /usr/src/app
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && apt install --no-install-recommends -y \
    curl \
    sudo \
    git && \
    apt-get clean

RUN python -m pip install --upgrade pip && pip install \
    poetry \
    numpy \
    matplotlib \
    pandas \
    pDESy

# RUN pip install git+https://github.com/pDESy/pDESy.git

# JupyterLab and Plotly
RUN pip install plotly==5.21.0
RUN pip install "jupyterlab>=3" "ipywidgets>=7.6"
RUN pip install jupyter-dash

ENV DEBIAN_FRONTEND dialog