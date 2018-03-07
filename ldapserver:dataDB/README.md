# ldapserver Dockerfile
# @edt ASIX M11-UF1 Curs 2017-2018
# Roger Ferran Aranguren

Creació d'un servidor ldapserver:base
Servidor ldap base per treballar interactivament.
Cal executar el servei manualment.

## Utilització

    docker build -t nomImatge .

### Si s'ha especificat CMD ["/bin/bash"] podem cridar-lo així i s'executarà el bash sol.

    docker run --name nomContenidor -h nomContenidor -it nomImatge

### Sinó, caldrà afegir-ho

    docker run --name nomContenidor -h nomContenidor -it nomImatge /bin/bash

### Si volem iniciar el contenidor de ldap cal saber que és millor utilitzar-lo com a deamon, per tant caldrà iniciar-lo de la següent manera

    docker run --name nomContenidor -h nomContenidor -it -d nomImatge

### Per executar en una altra consola el bash d'un contenidor

    docker exec -it nomContenidor /bin/bash
