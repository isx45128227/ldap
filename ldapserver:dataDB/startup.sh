#! /bin/bash

/usr/bin/echo "slapd OK"
/usr/sbin/slapd -d0 -u ldap -h "ldap:/// ldaps:/// ldapi:///"

