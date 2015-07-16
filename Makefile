NAME=mwaaas/django

build:
	docker build  -t $(NAME):$(v) --rm .

tag_latest:
	docker tag $(NAME):$(v) $(NAME):latest

test:
	nosetests -sv

push:
	docker push $(NAME):$(v)

build_ansible_base:
	docker build -t mwaaas/ansible_base:$(v) ansible_base_container

push_ansible_base:
	docker push mwaaas/ansible_base:$(v)

build_splunk_base:
	docker build -t mwaaas/splunk_base:$(v) splunk_base_container

push_splunk_base:
	docker push mwaaas/splunk_base:$(v)


boot2docker:
	eval "$(boot2docker shellinit)"