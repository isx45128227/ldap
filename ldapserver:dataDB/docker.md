# Docker dettach
[isx45128227@i03 ldapserver:dataDB]$ docker build -t prova2 .

[isx45128227@i03 ldapserver:dataDB]$ docker run --name h1 -h h1 -d prova2

[isx45128227@i03 ldapserver:dataDB]$ ldapsearch -x -h 172.17.0.2 -LLL -b 'dc=edt,dc=org' -s base

