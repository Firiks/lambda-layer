# Set the desired Python version
PYTHON_VERSION=3.9

# Remove the container first (if it exists).
docker rm lambda-layer-container

# Build Docker image
docker build --build-arg PYTHON_VERSION=${PYTHON_VERSION} -t lambda-layer .

# Create container and run it
docker run --name lambda-layer-container lambda-layer

# Copy the generated zip from /tmp/lambda-layer.zip to host
docker cp lambda-layer-container:/tmp/lambda-layer.zip .

# Remove container
docker rm lambda-layer-container

# Remove Docker image
docker rmi lambda-layer

echo "Lambda layer created successfully"