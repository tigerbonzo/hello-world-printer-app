.PHONY: test

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test --verbose -s

docker_build:
	docker build -t hello-world-printer .

USERNAME=tigerbonzo
TAG=$(USERNAME)/hello-world-printer
docker_push:
	docker login --username $(USERNAME) --password $(PASSWORD) ;\
	docker tag hello-world-printer $(TAG); \
	docker push $(TAG); \
	docker logout;
