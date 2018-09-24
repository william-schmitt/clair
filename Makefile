heroku:
	python herokify.py clair_config/config.yaml > clair_config.yaml # use the env variables to set up the config
	go install ./...
	${GOBIN}/clair -config=clair_config.yaml
