#!/bin/bash

# Clonar el repositorio 
echo "Clonando repositorio git@github.com:jsalazarudi/aeroclub.git"
sudo git clone git@github.com:jsalazarudi/aeroclub.git

# Copiar el repositorio en el /var/www/html
sudo cp -R aeroclub /var/www/html/

# Agregar el usaurio al grupo www-data
echo "Agregando el usuario $USER al grupo www-data"
sudo usermod -a -G www-data $USER

# Cambiar Propietario a www-data
echo "Cambiando propietario carpeta /var/www a www-data"
sudo chown -R :www-data /var/www

# Dar permisos a la carpeta
echo "Configurando permisos en la carpeta clonada "
sudo chmod -R 775 /var/www/html/aeroclub

echo "Por favor cerrar sesión y volver a ingresar para poder ejecutar el siguiente script"
