FROM ubuntu:20.04
RUN apt-get update && apt-get install -y software-properties-common
RUN apt-get update && apt-get install -y python3-pip curl python3-venv
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3
RUN source $HOME/.poetry/env
WORKDIR /code
RUN poetry install
CMD tail -f /dev/null
