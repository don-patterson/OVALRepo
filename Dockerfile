# Docker container for python3 and related dependencies.
#   build with: docker build . -t oval
#   run with:   docker run --rm -it --mount type=bind,source=$PWD,target=/opt/app oval bash
FROM python:3
WORKDIR /opt/app
COPY scripts/requirements.txt ./
RUN groupadd -r oval \
  && useradd --no-log-init -rmg oval oval \
  && pip install -r requirements.txt
USER oval
