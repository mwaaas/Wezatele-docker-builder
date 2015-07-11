FROM phusion/baseimage:0.9.16
MAINTAINER mwas
# prepare the image so that it can be configured by ansible roles
RUN apt-get -y update
RUN apt-get install -y python-yaml python-jinja2 git
RUN git config --global user.name "mwaside"
RUN git config --global user.email "francismwangi152@gmail.com"
RUN apt-get -y install software-properties-common
RUN add-apt-repository -y ppa:rquillo/ansible
RUN apt-get update
RUN apt-get -y install ansible
ADD inventory /etc/ansible/hosts
ADD . /tmp/devops
WORKDIR /tmp/devops

# create a directory to be used to create links for configuration
RUN mkdir config

# Configure common packages
RUN ansible-playbook common_config.yml -c local

# Configure app server packages
RUN ansible-playbook app_server_config.yml -c local

# Change the working directory to root
WORKDIR /root

# delete devops was just used for configurations
RUN rm -r /tmp/devops/
