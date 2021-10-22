FROM continuumio/miniconda3

ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt update
# C++ build tools for map2model and gl libs for lavavu
RUN apt install -y build-essential libglu1-mesa-dev freeglut3-dev mesa-common-dev

LABEL "repository"="https://github.com/riccorl/conda-publish-action"
LABEL "maintainer"="Riccorl"

RUN conda install -y anaconda-client conda-build conda-verify cython numpy scikit-build

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
