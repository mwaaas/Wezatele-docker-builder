NAME=mwaaas/django

build:
	docker build . -t $(NAME):$(v) --rm docker

tag_latest:
	docker tag $(NAME):$(v) $(NAME):latest

test:
	nosetests -sv

push:
	docker push $(NAME):$(v)
