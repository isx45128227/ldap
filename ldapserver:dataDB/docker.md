# Docker detached
	[isx45128227@i03 ldapserver:dataDB]$ docker build -t prova2 .

	[isx45128227@i03 ldapserver:dataDB]$ docker run --name h1 -h h1 -d prova2

	[isx45128227@i03 ldapserver:dataDB]$ ldapsearch -x -h 172.17.0.2 -LLL -b 'dc=edt,dc=org' -s base


# Docker dataDB
	[isx45128227@i03 dockerfiles]$ docker pull edtasixm11/ldapserver:dataDB
	
	[isx45128227@i03 dockerfiles]$ docker run --name h1 -h h1 -d edtasixm11/ldapserver:dataDB


	[isx45128227@i03 dockerfiles]$ nmap 172.17.0.2
	Starting Nmap 7.40 ( https://nmap.org ) at 2018-03-01 13:31 CET
	Nmap scan report for 172.17.0.2
	Host is up (0.000060s latency).
	Not shown: 998 closed ports
	PORT    STATE SERVICE
	389/tcp open  ldap
	636/tcp open  ldapssl

	Nmap done: 1 IP address (1 host up) scanned in 0.10 seconds


	# Fem consulta
	[isx45128227@i03 dockerfiles]$ ldapsearch -x -LLL -h 172.17.0.2 -b 'dc=edt,dc=org' -s base
	dn: dc=edt,dc=org
	dc: edt
	description: Escola del treball de Barcelona
	objectClass: dcObject
	objectClass: organization
	o: edt.org

	[isx45128227@i03 dockerfiles]$ docker network ls
	NETWORK ID          NAME                DRIVER
	26938d7177b5        bridge              bridge  --> EL host va a la seva i el docker també.            
	086944e7f7ff        none                null    --> No hi ha xarxa.            
	787179fe5351        host                host    --> La interfície de xarxa és la del host.


	[isx45128227@i03 dockerfiles]$ docker network inspect bridge 
	[
		{
			"Name": "bridge",
			"Id": "26938d7177b58e1957a0b49843a5ccc70e8dfccda8d7b0e697d1d4da35230a79",
			"Scope": "local",
			"Driver": "bridge",
			"IPAM": {
				"Driver": "default",
				"Options": null,
				"Config": [
					{
						"Subnet": "172.17.0.0/16"
					}
				]
			},
			"Containers": {
				"dca0c1bd9f46321f48475f76e3a6a87d0da5e62912330f04ace60da74d50c07b": {
					"Name": "h1",
					"EndpointID": "d5e4259299cbf1866f8fdf4220507a3a4a1657dd5fd4850a5b35321f8ecff1f1",
					"MacAddress": "02:42:ac:11:00:02",
					"IPv4Address": "172.17.0.2/16",
					"IPv6Address": ""
				}
			},
			"Options": {
				"com.docker.network.bridge.default_bridge": "true",
				"com.docker.network.bridge.enable_icc": "true",
				"com.docker.network.bridge.enable_ip_masquerade": "true",
				"com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
				"com.docker.network.bridge.name": "docker0",
				"com.docker.network.driver.mtu": "1500"
			}
		}
	]
	
	[isx45128227@i03 dockerfiles]$ docker inspect h1
	
	[isx45128227@i03 dockerfiles]$ docker exec -it h1 /bin/bash
	
	[root@h1 docker]# ldapsearch -x -LLL -s base                                 
	dn: dc=edt,dc=org
	dc: edt
	description: Escola del treball de Barcelona
	objectClass: dcObject
	objectClass: organization
	o: edt.org

	[root@h1 docker]# ldapsearch -x -LLL -h 172.17.0.3 -s base
	dn: dc=edt,dc=org
	dc: edt
	description: Escola del treball de Barcelona
	objectClass: dcObject
	objectClass: organization
	o: edt.org


	########## EXPOSE no publica els ports! ############
	## Per publicar els ports:

		hostIp:hostPort:ContainerPort/tcp
		hostIp:hostPort:ContainerPort/udp

		192.168.2.33:4327:389


	# Exposem ports dinàmicament

		[isx45128227@i03 ldapserver:dataDB]$ docker run -P --name h2 -h h2 -d prova

		[isx45128227@i03 ldapserver:dataDB]$ docker port h2
		389/tcp -> 0.0.0.0:32769
		636/tcp -> 0.0.0.0:32768

		[isx45128227@i03 ldapserver:dataDB]$ ldapsearch -x -LLL -h localhost:32769 -b 'dc=edt,dc=org' -s base
		dn: dc=edt,dc=org
		dc: edt
		description: Escola del treball de Barcelona
		objectClass: dcObject
		objectClass: organization
		o: edt.org


		[isx45128227@i03 ldapserver:dataDB]$ ldapsearch -x -LLL -h 127.0.0.1:32769 -b 'dc=edt,dc=org' -s base
		dn: dc=edt,dc=org
		dc: edt
		description: Escola del treball de Barcelona
		objectClass: dcObject
		objectClass: organization
		o: edt.org

		[isx45128227@i03 ldapserver:dataDB]$ ldapsearch -x -LLL -h 192.168.2.33:32769 -b 'dc=edt,dc=org' -s base
		dn: dc=edt,dc=org
		dc: edt
		description: Escola del treball de Barcelona
		objectClass: dcObject
		objectClass: organization
		o: edt.org

		[isx45128227@i03 ldapserver:dataDB]$ ldapsearch -x -LLL -h 172.17.0.1:32769 -b 'dc=edt,dc=org' -s base
		dn: dc=edt,dc=org
		dc: edt
		description: Escola del treball de Barcelona
		objectClass: dcObject
		objectClass: organization
		o: edt.org
		
		[isx45128227@i03 ldapserver:dataDB]$ ldapsearch -x -LLL -h i03:32769 -b 'dc=edt,dc=org' -s base
		dn: dc=edt,dc=org
		dc: edt
		description: Escola del treball de Barcelona
		objectClass: dcObject
		objectClass: organization
		o: edt.org
		
	# Exposem ports 
		[isx45128227@i03 ldapserver:dataDB]$ docker run -p 389:389 --name h2 -h h2 -d prova
