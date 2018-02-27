#! /bin/bash

/usr/bin/echo "slapd OK"
# la opcio -d0 fa que s'executi en primer pla, per tant podrem fer que el docker treballi com un deamon
/usr/sbin/slapd -d1 -u ldap -h "ldap:/// ldaps:/// ldapi:///"

