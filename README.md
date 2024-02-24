# Docker, NGINX, PHP-FPM, PostgreSQL, 

This is a simple logs collector for the dev environment

For example, we have a website (https://localhost/index.php)
```
/var/www/html/index.php
```
and we want to see logs in a new bookmark (https://localhost/logs.php)

How to set up it? First of all, need config NGINX (version for apache will be a letter) 

NGINX config file: 
```
location ~ /logs.php {
    include         fastcgi_params;
    root            /var/www/html/;
    fastcgi_pass    unix:/var/run/php/php7.2-fpm.sock;
    fastcgi_param   SCRIPT_FILENAME  /var/www/html/logs.php;
}
```
then put logs.php into 
