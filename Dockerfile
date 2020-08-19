FROM ubuntu:20.04
RUN apt-get update && apt-get install -y software-properties-common
RUN apt-get update && apt-get install -y python3-pip curl python3-venv
WORKDIR /code
CMD tail -f /dev/null
