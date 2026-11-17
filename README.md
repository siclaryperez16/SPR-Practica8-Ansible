
# Practica 8: Uso de Ansible para automatizar tareas en servidores

## 1. Objetivo

El objetivo de esta practica es aprender a utilizar Ansible para automatizar la administracion y configuracion de varios servidores Ubuntu mediante Docker.

Se crearon cinco servidores virtuales utilizando contenedores y se utilizo Ansible para ejecutar tareas automaticamente en todos ellos.

## 2. Tecnologias utilizadas

- Docker
- Docker Compose
- Ubuntu 24.04
- Ansible
- SSH
- Python 3

## 3. Archivos del proyecto

- Dockerfile: contiene la configuracion de la imagen Ubuntu con SSH.
- docker-compose.yml: permite crear los cinco servidores.
- inventario.ini: contiene los datos de conexion de los servidores.
- ansible.cfg: contiene la configuracion de Ansible.
- playbook.yml: contiene las tareas automatizadas.
- README.md: documentacion del proyecto.

## 4. Automatizaciones realizadas

Mediante Ansible se realizaron las siguientes tareas en los cinco servidores:

1. Actualizar la cache de APT.
2. Crear el usuario itla.
3. Crear una carpeta llamada app.
4. Crear el archivo hola.txt dentro de app.
5. Instalar cowsay.
6. Instalar htop.

## 5. Ejecucion

Para iniciar los cinco servidores:

```bash
docker compose up -d --build
```

Para ejecutar el playbook:

```bash
ansible-playbook playbook.yml
```

Para comprobar la conexion:

```bash
ansible servidores -m ping
```

## 6. Resultado

Se espera que los cinco servidores Ubuntu reciban correctamente las tareas ejecutadas mediante Ansible.
