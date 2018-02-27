#! /bin/bash

/usr/bin/echo "starting slapd..."
/usr/sbin/slapd -u ldap -h "ldap:/// ldaps:/// ldapi:///" && echo "ok slapd"

