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

 Para la ejecución de este script se realiza de la siguiente manera:

```Console
sudo ./Install-php-apache-composer-postgres.sh
```

`2. GenerateandConfig-ssh.sh`
    
Para la ejecucion de este script no es necesario ejecutarlo como sudo dado que la llave se va a generar por el usuario que estamos logueados. Entonces se ejecutaria de la siguiente manera:

```Console
./GenerateandConfig-ssh.sh
```

Luego de ejecutar el script en pantalla se muestra la clave ssh que agregaremos en el siguiente link:

* https://github.com/settings/keys

`3. CloningRepo.sh`

`4. ConfigAppAeroclub.sh`

`5. ConfigVirtualHost.sh`


