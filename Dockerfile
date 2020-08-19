FROM ubuntu:20.04
RUN apt update 
RUN apt install software-properties-common -f  
CMD tail -f /dev/null
