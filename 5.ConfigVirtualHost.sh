#!/bin/bash

# Haciendo backup de la configuracion de 000-default.conf
echo "Haciendo backup de la configuracion de 000-default.conf"
mv /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/000-default.conf.bk

# Creando el VirtualHost en 000-default.conf
echo "Creando el VirtualHost en 000-default.conf"
cat << EOF > /etc/apache2/sites-available/000-default.conf
<VirtualHost *:80>
	ServerAdmin dmoreno4@udi.edu.co
	DocumentRoot /var/www/html/aeroclub/public
	<Directory /var/www/html/aeroclub/public>
      		AllowOverride None
            DirectoryIndex index.php
        <IfModule mod_negotiation.c>
        Options -MultiViews
        </IfModule>
        <IfModule mod_rewrite.c>
            Options +FollowSymlinks
            RewriteEngine On
            RewriteCond %{REQUEST_URI}::$0 ^(/.+)/(.*)::\2$
            RewriteRule .* - [E=BASE:%1]
            RewriteCond %{HTTP:Authorization} .+
            RewriteRule ^ - [E=HTTP_AUTHORIZATION:%0]
            RewriteCond %{ENV:REDIRECT_STATUS} =""
            RewriteRule ^index\.php(?:/(.*)|$) %{ENV:BASE}/$1 [R=301,L]
            RewriteCond %{REQUEST_FILENAME} !-f
            RewriteRule ^ %{ENV:BASE}/index.php [L]
        </IfModule>
        <IfModule !mod_rewrite.c>
            <IfModule mod_alias.c>
                RedirectMatch 307 ^/$ /index.php/
            </IfModule>
        </IfModule>
	</Directory>
	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
EOF

# Reiniciando servicio apache
echo "Reiniciando servicio apache"
sudo systemctl restart apache2