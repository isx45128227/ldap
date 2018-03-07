# ldapserver Dockerfile
# @edt ASIX M11-UF1 Curs 2017-2018
# Roger Ferran Aranguren

Creació d'un servidor ldapserver:base

Servidor ldap base per treballar interactivament.

Cal executar el servei manualment.

## Utilització

### Construir imatge

    docker build -t nomImatge .

### Iniciar el contenidor de ldap com a deamon

    docker run --name nomContenidor -h nomContenidor -it -d nomImatge

### Per executar en una altra consola el bash d'un contenidor

    docker exec -it nomContenidor /bin/bash
