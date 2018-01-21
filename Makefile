service=ctx1

deploy: $(service)/$(service).service check-config deploy-bin deploy-config
	sudo cp $(service)/$(service).service /etc/systemd/system/$(service).service 
	sudo systemctl stop $(service)
	sudo systemctl enable $(service)
	sudo systemctl daemon-reload
	sudo systemctl restart $(service)
	sudo systemctl status $(service)
deploy-bin:
	sudo mkdir -p /usr/local/bin/
	( cd bin && for i in *; do sudo cp $$i /usr/local/bin/ && sudo chmod 755 /usr/local/bin/$i ;done )
deploy-config:
	sudo mkdir -p /usr/local/etc/docker-compose-systemd
	sudo cp -a $(service) /usr/local/etc/docker-compose-systemd/
	sudo chmod 755 /usr/local/etc/docker-compose-systemd/$(service)
	sudo chmod 644 /usr/local/etc/docker-compose-systemd/$(service)/*
check-config: $(service)/docker-compose.yml
	docker-compose -f $(service)/docker-compose.yml config


undeploy:
	sudo systemctl stop $(service) || true
	sudo systemctl disable $(service) || true
	if [ -f /etc/systemd/system/$(service).service ] ; then sudo rm /etc/systemd/system/$(service).service ; fi
	sudo systemctl daemon-reload
