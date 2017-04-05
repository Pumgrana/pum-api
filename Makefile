PROJECT_NAME := pumgrana-pum-api
REGISTRY := docker.pumgrana.com
LATEST := $(PROJECT_NAME):latest

docker:
	docker build -t $(LATEST) .

run:
	docker run -it $(LATEST)

push:
	$(eval VERSION = $(shell date +%Y%m%d%H))
	$(eval FULL_NAME = $(REGISTRY)/$(PROJECT_NAME):$(VERSION))
	docker tag $(LATEST) $(FULL_NAME)
	docker push $(LATEST)
	docker push $(FULL_NAME)
