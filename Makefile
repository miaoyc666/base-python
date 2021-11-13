# PRODUCT_VERSION为版本信息，打包时通过外部环境变量传入，打包命令示例: make so PRODUCT_VERSION=v3.2.0
PRODUCT_VERSION=v3.9.2
GIT_VERSION=$(shell git rev-parse --short HEAD)

IMAGE=base-python:${PRODUCT_VERSION}-${GIT_VERSION}

image:
	docker build -f Dockerfile -t ${IMAGE} . --network host

push:
	docker push ${IMAGE}

.PHONY: image