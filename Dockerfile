FROM phusion/baseimage:0.9.16
MAINTAINER mwas
# prepare the image so that it can be configured by ansible roles
RUN apt-get -y update
RUN apt-get install -y python-yaml python-jinja2 \
                gcc python-dev python-pip libpq-dev software-properties-common
RUN add-apt-repository -y ppa:rquillo/ansible
RUN apt-get update
RUN apt-get -y install ansible

# install the latest pip
RUN pip install pip --upgrade
