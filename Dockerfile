FROM phusion/baseimage:0.9.16
MAINTAINER mwas

# prepare the image to install essential packages
RUN apt-get update
RUN apt-get install -y gcc libpq-dev software-properties-common python-pip

# Build dependencies for Python Postgres adapter
RUN apt-get -y build-dep python-psycopg2

# install the latest pip
RUN pip install pip --upgrade

RUN mkdir /app

# code should be added in this directory
WORKDIR /app

RUN mkdir logs

# to be used by celery to run as root
ENV C_FORCE_ROOT="true"

# app server should run on this port
EXPOSE 3000