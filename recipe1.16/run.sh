## Bad Practice to run as root
# docker run --name mysqlwp -e MYSQL_ROOT_PASSWORD=wordpressdocker -d mysql
# docker run --name wordpress --link mysqlwp:mysql -p 80:80 -d wordpress

# Better Option
docker run --name mysqlwp -e MYSQL_ROOT_PASSWORD=wordpressdocker \
                          -e MYSQL_DATABASE=wordpress \
                          -e MYSQL_USER=wordpress \
                          -e MYSQL_PASSWORD=wordpresspwd \
                          -d mysql

docker run --name wordpress --link mysqlwp:mysql -p 80:80 \
                            -e WORDPRESS_DB_NAME=wordpress \
                            -e WORDPRESS_DB_USER=wordpress \
                            -e WORDPRESS_DB_PASSWORD=wordpresspwd \
                            -d wordpress
