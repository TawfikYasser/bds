# FROM python:latest

# WORKDIR /app

# # Searching in build context for requirements.txt to current dir ( . ) => /app
# COPY requirements.txt .

# RUN pip install -r requirements.txt

# COPY hello.py .

# EXPOSE 5000

# # Excueted in run time of the container, the commands are in the image medadata
# CMD python hello.py


### FROM Instruction
# Add more layers, from the base layer
FROM python
FROM ubuntu:18.04
FROM twkdocker/pyflask_t:v1.2
FROM python@sha256:403fd3ce9d68ce1ac3142d888297b1dbab35c5c38a268f34f4405bd01c9682ea
# Scratch: Image without layers
FROM scratch 

## WORKDIR / ADD / COPY INSTRUCTION
#  pwd or mkdir
WORKDIR /app
# it will consider that subdir is in app
WORKDIR subdir
# Copy from the build context
COPY hello.py /app/subdir/hello.py
COPY *.py /app/
COPY ["name with spaces.py", "/app"]
COPY . /app/

# .dockerignore like .gitignore (e.g. Dockerfile* *.pyc !important.pyc  etc)
# ADD to copy fiile outside the build context
ADD <url> /app
ADD <tar archive> /app/

## SHELL
# to choose the shell
SHELL ["/bin/bash", "-c"]
# Python repl is a shell also
SHELL ["/usr/local/bin/python", "-c"]


## RUN
# Excute commands in the standard shell
# can't work with inputs from the user
RUN <command> <arg1> <arg2>
# The below is better
RUN ["command", "arg1", "arg2"]

RUN echo "This is line" > /tmp/file
RUN echo "This is another" >> /tmp/file
RUN cat /tmp/file
RUN find / -name "python*" | wc -l
RUN pip install flask numpy
RUN apt update && apt upgrade -y
#to debug, see if java installed
RUN java -version
RUN apt install wget vim openssh-server -y

## metadata: no changes in image or runtime, only information to use
# LABEL: found in the inspect
LABEL maintainer="Tawfik"
LABEL description="Hoooo"
LABEL is_dev="true"

## ENV: make effect in image, gloabl for the build, for each intermediate container, even deleted
ENV <name> <value>
ENV SOL_SA_ACCOUNT "sa"
ENV SQL_USER=sa SQL_PASSWORD="P@ssw0rd"
ENV PATH $PATH:/app
ENV PATH="/usr/local/hadoop/bin:${PATH}"
ENV EMPTY ""

## USER for build
# e.g RUN groupadd haddop && useradd -g hadoop hduser
# User hduser
# RUN id


# Entrypoing and CMD while creating the container
## ENTRYPOINT the original command, CMC is the args of entrypoint

ENTRYPOINT [ "/bin/bash", "-c" ]

## CMD

CMD [ "<args for entrypoint>" ]

# ouput e.g. : /bin/bash -c python3

## ARG
# for the Dockerfile
ARG <arg>=<value>
ARG PYTHON_IMAGE_NAME=python
ARG PYTHON_IMAGE_TAG=3.8.17
ARG SQL_SA=sa
ARG SQL_PASSWORD=P@ssw0rd
FROM $PYTHON_IMAGE_NAME:$PYTHON_IMAGE_TAG

# For more than one Run and cmd use .sh file 