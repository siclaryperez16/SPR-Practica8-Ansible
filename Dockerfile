
# Imagen base de Ubuntu
FROM ubuntu:24.04

# Evitar preguntas durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Instalar SSH, sudo y Python
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    python3 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Crear usuario ansible y asignar contraseña
RUN useradd -m -s /bin/bash ansible && \
    echo "ansible:ansible" | chpasswd && \
    usermod -aG sudo ansible

# Configurar permisos sudo sin contraseña
RUN echo "ansible ALL=(ALL) NOPASSWD:ALL" \
    > /etc/sudoers.d/ansible && \
    chmod 0440 /etc/sudoers.d/ansible

# Configurar el servidor SSH
RUN mkdir -p /var/run/sshd && \
    ssh-keygen -A && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' \
    /etc/ssh/sshd_config

# Puerto SSH
EXPOSE 22

# Iniciar el servidor SSH
CMD ["/usr/sbin/sshd", "-D", "-e"]
