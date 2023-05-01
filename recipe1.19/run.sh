docker run -v /data --name data ubuntu:22.04

docker run --name mysqlwp --volumes-from data \
                          -v /home/docker/mysql:/var/lib/mysql \
                          -d mysql

docker run --name wordpress --link mysqlwp:mysql -p 80:80 \
                            --volumes-from data \
                            -d wordpress

docker exec mysqlwp touch /data/foo
docker exec wordpress touch /data/bar
docker exec mysqlwp ls /data
