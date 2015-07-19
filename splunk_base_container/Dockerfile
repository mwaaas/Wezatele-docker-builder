from mwaaas/ansible_base:0.0.1

ADD . /tmp/devops
WORKDIR /tmp/devops

# Configure common packages
RUN ansible-playbook splunk_config.yml -c local

# Change the working directory to root
WORKDIR /root

# delete devops was just used for configurations
RUN rm -r /tmp/devops/
