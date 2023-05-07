#!/bin/bash


# Definicion de Correo Electronico para generar llave SSH
echo "Por favor Ingresar el correo asociado a su cuenta GitHub Ej: your_email@example.com"
read correo_git

# Definición de contraseña para conexion SSH a GitHub
echo "Por favor, Escribe la contraseña para la conexión SSH a GitHub"
read pass_ssh

# Crea el directorio ~/.ssh si no existe
if [ ! -d ~/.ssh ]; then
  mkdir -p ~/.ssh
  chmod 700 ~/.ssh
fi

# Verificar si la clave ssh ya existe
if [ -f ~/.ssh/id_ed25519 ]; then
    echo "La clave ssh ya existe en el archivo ~/.ssh/id_ed25519."
else
    # Generar Clave ssh con el algoritmo ed25519 para conectar server linux
    ssh-keygen -t ed25519 -C "$correo_git" -N "$pass_ssh" -f ~/.ssh/id_ed25519

    echo "Clave ssh generada y guardada en el archivo ~/.ssh/id_ed25519."
fi

# Crea el archivo ~/.ssh/config si no existe
if [ ! -f ~/.ssh/config ]; then
  touch ~/.ssh/config
  chmod 600 ~/.ssh/config
fi

# Agrega la información al archivo ~/.ssh/config
echo "Host *" >> ~/.ssh/config
echo "  AddKeysToAgent yes" >> ~/.ssh/config
echo "  IdentityFile /home/necochea/.ssh/id_ed25519" >> ~/.ssh/config

echo "Archivo ~/.ssh/config creado y configurado correctamente."

# Start the ssh-agent in the background.
eval "$(ssh-agent -s)"

# Add your SSH private key to the ssh-agent
ssh-add ~/.ssh/id_ed25519

# Mostar en pantalla la clave SSH para agregar en la pagina de GitHub
echo "Esta es tu clave SSH para agregar en las configuraciones de GitHub"
cat ~/.ssh/id_ed25519.pub

echo "Ingresar por favor al siguiente link https://github.com/settings/keys"