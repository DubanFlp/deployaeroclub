#!/bin/bash

# Configurar el .shh/config del usaurio necochea en el root para poder clonar
echo "Configurando que el usuario root utilice la key ssh del usuario necochea"
cp /home/necochea/.ssh/config ~/.ssh/

# Clonar el repositorio 
echo "Clonando repositorio git@github.com:jsalazarudi/aeroclub.git"
cd /var/www/html/
sudo git clone git@github.com:jsalazarudi/aeroclub.git

# Cambiar de directorio a /var/www/html/aeroclub
cd /var/www/html/aeroclub

# Configuracion Conexion Git 
echo "Configurando parametros de GIT"
git config --global user.name "UbuntuServer"
git config --global user.email "dubanfelipem@gmail.com"
git config --global --add safe.directory /var/www/html/aeroclub

# Agregar el usaurio al grupo www-data
echo "Agregando el usaurio al grupo www-data"
sudo usermod -a -G www-data necochea

# Cambiar Propietario a www-data
echo "Cambiando propietario carpeta /var/www a www-data"
sudo chown -R :www-data /var/www

# Dar permisos a la carpeta
echo "Configurando permisos en la carpeta clonada "
sudo chmod -R 775 /var/www/html/aeroclub


