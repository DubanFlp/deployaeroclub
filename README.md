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
sudo ./1.Install-php-apache-composer-postgres.sh
```

`2. CloningRepo.sh`

La finalidad de este script es clonar el repositorio `https://github.com/jsalazarudi/aeroclub.git` en el servidor y establecer los permisos adecuados en la carpeta clonada. El script realiza los siguientes pasos:

+ Clona el repositorio `https://github.com/jsalazarudi/aeroclub.git` en el directorio `/var/www/html/`.
+ Agrega el usuario logueado al grupo `www-data`.
+ Cambia el propietario de la carpeta `/var/www` al usuario a "www-data".
+ Configura los permisos en la carpeta clonada `/var/www/html/aeroclub`. Los permisos se establecen en 775, lo que  significa que el propietario y el grupo tienen permisos completos y el resto de los usuarios tienen permisos de lectura y escritura

La ejecución de este script se realiza de la siguiente manera:

```Console
./2.CloningRepo.sh
```

`3. ConfigAppAeroclub.sh`

El objetivo de este script es preparar un proyecto web basado en Symfony para ser desplegado en un servidor en producción. Los cambios realizados en el archivo `.env.local` se enfocan en configurar el proyecto para que use las credenciales de base de datos y las variables de entorno adecuadas para el entorno de producción. Además, se instala una dependencia llamada `symfony/apache-pack` que proporciona una serie de herramientas útiles para la configuración y gestión de un servidor web basado en Symfony. El script realiza los siguientes pasos:

+ Instala una dependencia llamada symfony/apache-pack en un proyecto web ubicado en `/var/www/html/aeroclub` mediante el administrador de paquetes de PHP Composer.
+ Crea un archivo llamado `.env.local` en el directorio del proyecto, copiando el contenido de un archivo existente llamado ".env".
+ Modifica una variable de entorno llamada `PASSWORD_ADMIN` en el archivo `.env.local` de "#" (comentario) a "necochea23".
+ Modifica la cadena de conexión a la base de datos en el archivo `.env.local` para que apunte a un servidor de base de datos PostgreSQL en "127.0.0.1:5432" utilizando el nombre de usuario, contraseña y la base de datos "aeroclub".
+ Ejecuta migraciones de la base de datos.
+ Configura Usuario administrador en el aplicativo.
+ Cambia una variable de entorno llamada `APP_ENV` de "dev" a "prod" en el archivo `.env.local`.

```Console
./3.ConfigAppAeroclub.sh
```

`4. ConfigVirtualHost.sh`

Este script configura un VirtualHost en Apache para un sitio web del Aeroclub y reinicia el servicio de Apache para activar la nueva configuración. El script realiza los siguientes pasos:

+ Copia de seguridad del archivo de configuración existente `000-default.conf` en el directorio `/etc/apache2/sites-available`.
+ Crear un nuevo VirtualHost en el archivo `000-default.conf` utilizando la sintaxis de Apache. Este VirtualHost especifica la dirección del servidor de correo electrónico del administrador y la ruta de acceso al directorio de documentos del sitio web, así como la configuración de permisos de archivo y de directorio para la carpeta pública. También establece algunas opciones de configuración de Apache como el manejo de errores y los registros de acceso.
+ Reinicia el servicio de Apache para que los cambios de configuración tengan efecto.

Para poder ejecutar este script, debes ejecutar el comando con permisos sudo ya que se editaran archivos de la carpeta `/etc/apache2/sites-available` la cual requiere permisos de administrador.

```Console
sudo ./4.ConfigVirtualHost.sh
```


Validaremos que el aplicativo web esté funcionando, para esto probaremos de forma local ingresando al siguiente link 

* http://localhost/index.php/login