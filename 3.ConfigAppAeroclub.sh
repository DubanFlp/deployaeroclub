#!/bin/bash

# Instalando dependencia de symfony/apache-pack mediante composer
echo "Instalando dependencia de symfony/apache-pack mediante composer"
cd /var/www/html/aeroclub
composer require symfony/apache-pack

# Crear el .env.local y realizar las siguientes validaciones
echo "Creando el archivo .env.local..."
cp /var/www/html/aeroclub/.env /var/www/html/aeroclub/.env.local

# Cambiando la variable dev a prod
echo "Cambiando la variable 'APP_ENV' de 'dev' a 'prod'..."
grep -qxF 'APP_ENV=dev' .env.local && sed -i 's/APP_ENV=dev/APP_ENV=prod/' .env.local

# Modificando la contraseña del administrador
echo "Modificando la contraseña del administrador..."
grep -qxF '# PASSWORD_ADMIN=null' .env.local && sed -i 's/# PASSWORD_ADMIN=null/PASSWORD_ADMIN=necochea23/' .env.local

# Modificando la conexión a la base de datos
echo "Modificando la conexión a la base de datos..."
sed -i '/^DATABASE_URL/s/^/# /' .env.local
echo -e "\n" >> .env.local
echo 'DATABASE_URL="postgresql://aeroclub:aeroclub23@127.0.0.1:5432/aeroclub?serverVersion=15&charset=utf8"' >> .env.local



