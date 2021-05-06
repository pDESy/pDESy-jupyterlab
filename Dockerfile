FROM python:3
USER root
WORKDIR /usr/src/app
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install --no-install-recommends -y \
    curl \
    sudo \
    git && \
    apt-get clean

RUN python -m pip install --upgrade pip && pip install \
    poetry \
    pandas \
    jupyterlab

RUN pip install pDESy
# RUN pip install git+https://github.com/pDESy/pDESy.git

RUN jupyter serverextension enable --py jupyterlab

# nodejs for plotly
# https://github.com/nodesource/distributions/blob/master/README.md
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
    && sudo apt-get install -y nodejs

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build \
    && jupyter labextension install jupyterlab-plotly --no-build \
    && jupyter labextension install plotlywidget --no-build \
    && jupyter lab build

ENV DEBIAN_FRONTEND dialog