# Aplicativo Web para la gestion de servicios aeronuaticos ofrecidos por el aeroclub general necochea de la provincia de Buenos Aires,Argentina

## Descripción
Instrucciones sobre la configuración del servidor para aplicativo del aeroclub Necochea

### Integrantes:

Duban Felipe Moreno Ayala

Jairo Andres Vesga Salazar

### Requerimientos: 

* Ubuntu 22.04 LTS

### Orden de ejecución de scripts

`1. Install-php-apache-composer-postgres.sh`

El objetivo de este script es automatizar la instalación y configuración de un entorno de desarrollo web con PHP, Apache, Composer y PostgreSQL. El script realiza los siguientes pasos:

+ Actualiza el sistema operativo
+ Agrega el repositorio PHP y actualiza el sistema
+ Instala PHP 8.2 y sus dependencias
+ Instala Apache y mod_php
+ Configura Apache para iniciar al arrancar el sistema
+ Instala Composer y sus dependencias
+ Verifica si PostgreSQL está instalado, y si no lo está, lo instala
+ Crea un usuario y le da permisos para crear bases de datos en PostgreSQL

La ejecución de este script se realiza de la siguiente manera:

```Console
sudo ./Install-php-apache-composer-postgres.sh
```

`2. GenerateandConfig-ssh.sh`
    
No es necesario ejecutar este script con permisos sudo, ya que la llave se va a generar por el usuario que esté logueado. La ejecución se realiza de la siguiente manera:

```Console
./GenerateandConfig-ssh.sh
```

Después de ejecutar el script, se mostrará la clave SSH que deberás agregar en el siguiente enlace:

* https://github.com/settings/keys

`3. CloningRepo.sh`

Para poder ejecutar este script, debes tener configurada previamente la llave SSH en la página de GitHub. Además, debes ejecutar el comando con permisos sudo, ya que se clonará el repositorio en la ruta `/var/www/html/`, la cual requiere permisos de administrador.

```Console
sudo ./CloningRepo.sh
```

`4. ConfigAppAeroclub.sh`

```Console
./ConfigAppAeroclub.sh
```

`5. ConfigVirtualHost.sh`


