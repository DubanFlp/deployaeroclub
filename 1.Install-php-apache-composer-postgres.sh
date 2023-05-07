#! /bin/bash

# Actualizar sistema
echo "Actualizando sistema operativo..."
sudo apt update && sudo apt -y upgrade

# Agregar repositorio php
echo "Agregando repositorio php..."
sudo apt install -y lsb-release gnupg2 ca-certificates apt-transport-https software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update

# Instalar php8.2
echo "Instalando php8.2 y dependencias necesarias..."
sudo apt install -y php8.2
sudo apt install -y php8.2-{bcmath,fpm,xml,mysql,zip,intl,ldap,gd,cli,bz2,curl,mbstring,pgsql,opcache,soap,cgi}

# Instalar Apache
echo "Instalando Apache.."
sudo apt install -y apache2 libapache2-mod-php8.2

# Enable mod_php modulo
echo "Habilitando modulo mod_php..."
sudo a2enmod php8.2

# Reiniciar Servicio 
echo "Reiniciando servicio de Apache..."
sudo systemctl restart apache2

# Configurar que inicie php al arrancar el sistema
echo "Configurando Apache en el arranque del sistema..." 
sudo systemctl enable apache2

# Instalar Composer 
# Instalar dependencias Composer 
echo 'Instalando dependencias...'
sudo apt install -y php-cli unzip

# Descargar Composer
echo 'Descargando Composer...'
cd ~
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php

# Verificar hash de instalador
echo 'Verificando hash de instalador...'
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"

# Instalar Composer
echo 'Instalando Composer...'
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
echo '¡Listo! Composer ha sido instalado correctamente.'

# Verificar si PostgreSQL está instalado
if ! [ -x "$(command -v psql)" ]; then
  # Si PostgreSQL no está instalado, instalarlo
  sudo apt update
  sudo apt install -y postgresql postgresql-contrib
else
  # Si PostgreSQL ya está instalado, mostrar mensaje de advertencia
  echo "PostgreSQL ya está instalado en este sistema."
fi

# Cambiar de directorio a /tmp
cd /tmp

# Crear usuario y dar permisos para crear db
if sudo -u postgres psql -lqt | cut -d \| -f 1 | grep -qw aeroclub; then
  echo "El usuario ya existe en la base de datos."
else
  # Si el usuario no existe, crearlo y darle permisos
  sudo -u postgres psql -c "CREATE USER aeroclub WITH PASSWORD 'aeroclub23';"
  sudo -u postgres psql -c "ALTER USER aeroclub CREATEDB;"
  sudo -u postgres psql -c "CREATE DATABASE aeroclub;"
fi