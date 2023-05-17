#!/bin/bash

# Clonar el repositorio 
echo "Clonando repositorio git@github.com:jsalazarudi/aeroclub.git"
cd /var/www/html/
sudo git clone git@github.com:jsalazarudi/aeroclub.git

# Cambiar de directorio a /var/www/html/aeroclub
cd /var/www/html/aeroclub

# Agregar el usaurio al grupo www-data
echo "Agregando el usaurio $USER al grupo www-data"
sudo usermod -a -G www-data $USER

# Cambiar Propietario a www-data
echo "Cambiando propietario carpeta /var/www a www-data"
sudo chown -R :www-data /var/www

# Dar permisos a la carpeta
echo "Configurando permisos en la carpeta clonada "
sudo chmod -R 775 /var/www/html/aeroclub

echo "Por favor cerrar sesión y volver a ingresar para poder ejecutar el siguiente script"
