# dont use latest tag https://github.com/nodesource/distributions/issues/1524
FROM amazonlinux:2 

# Set the desired Node.js version
ARG NODE_VERSION=16.x

# Install Node.js
RUN yum -y update && \
    yum -y install gcc-c++ make git zip && \
    curl -sL https://rpm.nodesource.com/setup_${NODE_VERSION} | bash - && \
    yum -y install nodejs && \
    node -v && \
    yum clean all

# Install required packages
COPY package.json /tmp/package.json
RUN cd /tmp && npm install --no-package-lock --no-audit

# Create lambda-layer.zip
RUN cd /tmp/node_modules && \
    zip -r9 /tmp/lambda-layer.zip . && \
    rm -rf /tmp/node_modules

ENTRYPOINT ["/bin/bash", "-l"]