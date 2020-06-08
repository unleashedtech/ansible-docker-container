ARG ALPINE_VERSION=latest
FROM alpine:${ALPINE_VERSION}
MAINTAINER "Unleashed Technologies"

# Over rides SSH Hosts Checking
RUN mkdir ~/.ssh && \
    echo "host *" >> ~/.ssh/config && \
    echo "StrictHostKeyChecking no" >> ~/.ssh/config

RUN \
 apk add --no-cache \
   ansible \
   openssh-client \
   sshpass \
   git \
   bash

# Makes a directory for playbook
RUN mkdir -p /playbook
# Makes the playbooks directory the working directory
WORKDIR /playbook

# Sets environment variables
ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING False
ENV ANSIBLE_RETRY_FILES_ENABLED False
ENV ANSIBLE_ROLES_PATH /playbook/roles
ENV ANSIBLE_SSH_PIPELINING True

# Sets entry point (same as running ansible-playbook)
ENTRYPOINT ["ansible-playbook"]
