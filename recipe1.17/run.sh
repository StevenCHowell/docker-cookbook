docker run --name mysqlwp -e MYSQL_ROOT_PASSWORD=wordpressdocker \
                          -e MYSQL_DATABASE=wordpress \
                          -e MYSQL_USER=wordpress \
                          -e MYSQL_PASSWORD=wordpresspwd \
                          -v /home/docker/mysql:/var/lib/mysql \
                          -d mysql

docker run --name wordpress --link mysqlwp:mysql -p 80:80 \
                            -e WORDPRESS_DB_NAME=wordpress \
                            -e WORDPRESS_DB_USER=wordpress \
                            -e WORDPRESS_DB_PASSWORD=wordpresspwd \
                            -d wordpress
