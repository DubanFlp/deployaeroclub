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

El proposito del script es generar una clave SSH y configurarla correctamente para permitir una conexión segura entre la computadora local y la cuenta de GitHub del usuario. Al generar una clave SSH y agregarla a la cuenta de GitHub, el usuario puede conectarse y realizar acciones en su cuenta de GitHub sin tener que ingresar su nombre de usuario y contraseña cada vez que realiza una operación, lo que aumenta la seguridad y la comodidad al mismo tiempo. La clave SSH también se utiliza para autenticar al usuario con el servidor remoto y encriptar las comunicaciones entre la computadora local y el servidor remoto. El script realiza los siguientes pasos:

+ Solicita al usuario que proporcione su correo electrónico asociado a su cuenta de GitHub y la contraseña para la conexión SSH a GitHub. 
+ Verifica si el directorio ~/.ssh existe y, si no existe, lo crea y le asigna permisos.
+ Verifica si la clave SSH ya existe en el archivo ~/.ssh/id_ed25519. Si no existe, genera una clave SSH con el algoritmo ed25519 y la guarda en el archivo ~/.ssh/id_ed25519. 
+ Crea el archivo ~/.ssh/config si no existe y agrega información de configuración en él. 
+ Inicia el agente SSH en segundo plano, agrega la clave SSH privada al agente SSH y muestra la clave SSH pública en la pantalla. 
+ Solicita al usuario que agregue la clave SSH pública en la página de configuración de claves de GitHub. * https://github.com/settings/keys

No es necesario ejecutar este script con permisos sudo, ya que la llave se va a generar por el usuario que esté logueado. La ejecución se realiza de la siguiente manera:

```Console
./GenerateandConfig-ssh.sh
```

`3. CloningRepo.sh`

La finalidad de este script es clonar el repositorio `git@github.com:jsalazarudi/aeroclub.git` en el servidor, configurar la conexión a Git y establecer los permisos adecuados en la carpeta clonada. El script realiza los siguientes pasos:

+ Configura el archivo ~/.ssh/config para que el usuario root pueda utilizar la clave SSH del usuario "necochea".
+ Clona el repositorio `git@github.com:jsalazarudi/aeroclub.git` en el directorio `/var/www/html/`.
+ Configura los parámetros de GIT, como el nombre de usuario, correo electrónico y directorio seguro.
+ Agrega el usuario "necochea" al grupo "www-data".
+ Cambia el propietario de la carpeta `/var/www al usuario` "www-data".
+ Configura los permisos en la carpeta clonada `/var/www/html/aeroclub`. Los permisos se establecen en 775, lo que  significa que el propietario y el grupo tienen permisos completos y el resto de los usuarios tienen permisos de lectura y escritura

Para poder ejecutar este script, debes tener configurada previamente la llave SSH en la página de GitHub. Además, debes ejecutar el comando con permisos sudo, ya que se clonará el repositorio en la ruta `/var/www/html/`, la cual requiere permisos de administrador.

```Console
sudo ./CloningRepo.sh
```

`4. ConfigAppAeroclub.sh`

```Console
./ConfigAppAeroclub.sh
```

`5. ConfigVirtualHost.sh`


