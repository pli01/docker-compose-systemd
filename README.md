# docker-compose-systemd

Simple and basic: docker-compose service launched via unit systemd

* Repository tree

```
├── bin
│   ├── docker-compose_start
│   ├── docker-compose_start_post
│   ├── docker-compose_start_pre
│   ├── docker-compose_stop
│   └── docker-compose_systemd.conf
├── ctx1
│   ├── ctx1.service
│   └── docker-compose.yml
├── ctx-simple
│   ├── ctx-simple.service
│   └── docker-compose.yml
├── Makefile
└── README.md
```

* bin: wrapper script to start/stop docker-compose
* ctx*: config file to start on service, contains unit systemd + docker-composer.yml
* Makefile: deploy, undeploy, install wrapper script, composer and unit-systemd

```
 # make deploy service=ctx-simple to install, and start service ctx-simple
 # make undeploy service=ctx-simple to uninstall service ctx-simple
```


* Installation tree
  * /usr/local/etc/docker-composer-systemd/{SERVICE}/docker-compose.yml : service compose configuration
```
/usr/local/etc/docker-compose-systemd
└── ctx1
    ├── ctx1.service
    ├── docker-compose-simple.yml
    └── docker-compose.yml
```

  * /usr/local/bin/docker-composer-systemd* : wrapper script
```
/usr/local/bin/
├── docker-compose
├── docker-compose_start
├── docker-compose_start_post
├── docker-compose_start_pre
├── docker-compose_stop
├── docker-compose_systemd.conf
```

  * /etc/systemd/system/{SERVICE}.service : unit systemd to start compose
```
/etc/systemd/system/ctx1.service
```
