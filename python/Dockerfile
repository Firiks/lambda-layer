FROM amazonlinux:latest

# Set the desired Python version
ARG PYTHON_VERSION=3.9

# Install Python and required packages
RUN yum -y update && \
    yum -y install python${PYTHON_VERSION} python${PYTHON_VERSION}-devel python${PYTHON_VERSION}-pip && \
    yum clean all

# Install required packages
COPY requirements.txt /tmp/requirements.txt
RUN python${PYTHON_VERSION} -m pip install --target /opt/python/ --no-cache-dir -r /tmp/requirements.txt && \
    rm /tmp/requirements.txt

# Create lambda-layer.zip
RUN cd /opt/python && \
    zip -r9 /tmp/lambda-layer.zip . && \
    rm -rf /opt/python

ENTRYPOINT ["/bin/bash", "-l"]