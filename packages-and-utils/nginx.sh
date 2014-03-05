# INSTALLATION

# install and configure nginx on ubuntu. Based on article:
# https://www.digitalocean.com/community/articles/how-to-install-nginx-on-ubuntu-12-04-lts-precise-pangolin

apt-get install nginx

# start
service nginx start

# ensure it works. Copy IP adress, returned by the following command and paste into browser.
ifconfig eth0 | grep inet | awk '{ print $2 }'

# check if nginx is up on system boot.
update-rc.d nginx defaults

# SERVE STATIC CONTENT

# create static file
mkdir /var/www
echo '<!doctype html><html><head><title>Hi</title></head></html>' >> /var/www/index.html

# Insert into file /etc/nginx/conf.d/test.conf the following file lines:
# server {
#   location / {
#     root /var/www;
#   }
# }
nconf = "/etc/nginx/conf.d/test.conf"

echo 'server {'                                 >> nconf
echo '  location / {'                           >> nconf
echo '      root /var/www;'                     >> nconf
echo '  }'                                      >> nconf
echo ''                                         >> nconf
echo '  location ~ ^/files {'                   >> nconf
echo '      rewrite ^/files(.*) $1 break;'      >> nconf
echo '      root /var/www/myfiles;'             >> nconf
echo '  }'                                      >> nconf
echo '}'                                        >> nconf

# reload nginx config
nginx -s reload

# will return our html file
wget http://localhost/index.html