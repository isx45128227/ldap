# @edt ASIX M11 Curs 2017-2018
# ldapserver:base
# servidor ldap creacio interactiu
# ----------------------------------

FROM fedora:24
MAINTAINER @isx45128227 "@edt ASIX M11 Curs 2017-2018"
RUN mkdir /opt/docker/
COPY * /opt/docker/
COPY ldap.conf /etc/openldap/
RUN dnf -y update vi
RUN dnf -y install vim procps iputils iproute tree nmap mlocate \
		   openldap openldap-clients openldap-servers man-db
RUN chmod +x /opt/docker/install.sh /opt/docker/startup.sh
WORKDIR /opt/docker
CMD ["/bin/bash"]
