#! /bin/bash
/usr/bin/echo "Creating DB edt.org..."
rm -rf /etc/openldap/slapd.d/*
rm -rf /var/lib/ldap/*
cp /usr/share/openldap-servers/DB_CONFIG.example /var/lib/ldap/DB_CONFIG
slaptest -f /opt/docker/slapd.conf -F /etc/openldap/slapd.d
slapadd -F /etc/openldap/slapd.d -l /opt/docker/organitzacio-edt.org.ldif
chown -R ldap.ldap /etc/openldap/slapd.d/
chown -R ldap.ldap /var/lib/ldap/
