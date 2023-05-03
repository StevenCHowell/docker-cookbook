rm *.tar.gz
docker stop $(docker ps -q)
docker rm -v $(docker ps -aq)
docker rmi update01 update02 ubuntu
