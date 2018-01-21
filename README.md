# docker-compose-systemd

Simple and basic: docker-compose service launched via unit systemd

* Repository tree
* bin: wrapper script to start/stop docker-compose
* ctx*: config file to start on service, contains unit systemd + docker-composer.yml
* Makefile: deploy, undeploy wrapper script and unit-systemd
 * make deploy service=ctx-simple to install, and start service ctx-simple
 * make undeploy service=ctx-simple to uninstall service ctx-simple

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

* Installation tree
  * /usr/local/bin/docker-composer-systemd* : wrapper script
  * /usr/local/etc/docker-composer-systemd/{SERVICE}/docker-compose.yml : service compose configuration
  * /etc/systemd/system/{SERVICE}.service : unit systemd to start compose

