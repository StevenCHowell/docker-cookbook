# Notes
I was not able to successfully buld the `Dockerfile`. I get the following errors.

## Using Ubuntu 14.04

```bash
╰─ docker build -t wordpress .                                                                                                            ─╯
[+] Building 0.3s (11/12)
 => [internal] load build definition from Dockerfile                                                                                    0.0s
 => => transferring dockerfile: 822B                                                                                                    0.0s
 => [internal] load .dockerignore                                                                                                       0.0s
 => => transferring context: 2B                                                                                                         0.0s
 => [internal] load metadata for docker.io/library/ubuntu:14.04                                                                         0.2s
 => [1/8] FROM docker.io/library/ubuntu:14.04@sha256:64483f3496c1373bfd55348e88694d1c4d0c9b660dee6bfef5e12f43b9933b30                   0.0s
 => => resolve docker.io/library/ubuntu:14.04@sha256:64483f3496c1373bfd55348e88694d1c4d0c9b660dee6bfef5e12f43b9933b30                   0.0s
 => [internal] load build context                                                                                                       0.0s
 => => transferring context: 38B                                                                                                        0.0s
 => CACHED [2/8] RUN apt update && apt -y install     apache2     php5     php5-mysql     supervisor     wget     fzf     htop     vim  0.0s
 => CACHED [3/8] RUN echo 'mysql-server mysql-server/root_password password root' |     debconf-set-selections &&     echo 'mysql-serv  0.0s
 => CACHED [4/8] RUN apt install -qqy mysql-server                                                                                      0.0s
 => CACHED [5/8] RUN wget http://wordpress.org/latest.tar.gz &&     tar xzvf latest.tar.gz &&     cp -R ./wordpress/* /var/www/html &&  0.0s
 => CACHED [6/8] RUN (/usr/bin/mysqld_safe &); sleep 5; mysqladmin -u root -proot create wordpress                                      0.0s
 => ERROR [7/8] COPY wp-config.php /var/www/html/wp-config.php                                                                          0.0s
------
 > [7/8] COPY wp-config.php /var/www/html/wp-config.php:
------
Dockerfile:27
--------------------
  25 |     RUN (/usr/bin/mysqld_safe &); sleep 5; mysqladmin -u root -proot create wordpress
  26 |
  27 | >>> COPY wp-config.php /var/www/html/wp-config.php
  28 |     COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
  29 |
--------------------
ERROR: failed to solve: failed to compute cache key: failed to calculate checksum of ref moby::vmak6i7v4sx9062yke5r3v265: "/wp-config.php": not found
```

## Using Ubuntu 22.04

```bash
╰─ docker build -t wordpress .                                                                                                            ─╯
[+] Building 0.3s (11/12)
 => [internal] load build definition from Dockerfile                                                                                    0.0s
 => => transferring dockerfile: 822B                                                                                                    0.0s
 => [internal] load .dockerignore                                                                                                       0.0s
 => => transferring context: 2B                                                                                                         0.0s
 => [internal] load metadata for docker.io/library/ubuntu:22.04                                                                         0.0s
 => CACHED [1/8] FROM docker.io/library/ubuntu:22.04                                                                                    0.0s
 => [internal] load build context                                                                                                       0.0s
 => => transferring context: 38B                                                                                                        0.0s
 => CANCELED [2/8] RUN apt update && apt -y install     apache2     php5     php5-mysql     supervisor     wget     fzf     htop     v  0.3s
 => CACHED [3/8] RUN echo 'mysql-server mysql-server/root_password password root' |     debconf-set-selections &&     echo 'mysql-serv  0.0s
 => CACHED [4/8] RUN apt install -qqy mysql-server                                                                                      0.0s
 => CACHED [5/8] RUN wget http://wordpress.org/latest.tar.gz &&     tar xzvf latest.tar.gz &&     cp -R ./wordpress/* /var/www/html &&  0.0s
 => CACHED [6/8] RUN (/usr/bin/mysqld_safe &); sleep 5; mysqladmin -u root -proot create wordpress                                      0.0s
 => ERROR [7/8] COPY wp-config.php /var/www/html/wp-config.php                                                                          0.0s
------
 > [7/8] COPY wp-config.php /var/www/html/wp-config.php:
------
Dockerfile:27
--------------------
  25 |     RUN (/usr/bin/mysqld_safe &); sleep 5; mysqladmin -u root -proot create wordpress
  26 |
  27 | >>> COPY wp-config.php /var/www/html/wp-config.php
  28 |     COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
  29 |
--------------------
ERROR: failed to solve: failed to compute cache key: failed to calculate checksum of ref moby::rf6f5p315krnx3xkn2frwhtcu: "/wp-config.php": not found
```