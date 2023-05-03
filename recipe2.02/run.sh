# Start a container
docker run -d --name recipe2 ubuntu:22.04 sleep 30

# Make some change inside the container
docker exec recipe2 apt update

# View the extent of those changes
docker diff recipe2

# Commit a modified Docker image for later use
docker commit recipe2 ubuntu:update

## Export a stopped container (squashes the history)

# # Export the container to a tarball
# docker export recipe2 > update01.tar

# Export the container to a compressed tarball
docker export recipe2 | gzip > update01.tar.gz

# Import the tarball to a new container image
docker import - update01 < update01.tar.gz

# Start the imported container
docker run -d update01 sleep 15

## Save an image (maintains the history)

# # Export the container to a tarball
# docker save -o update02.tar update01

# Export the container to a compressed tarball
docker save -o update02.tar.gz update01

# Import the tarball to a new container image
docker import - update02 < update02.tar.gz

# Start the imported container
docker run -d update02 sleep 15
