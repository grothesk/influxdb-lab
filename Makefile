.PHONY: deploy

BUILD_DIR := deploy/build
RENDERED_MANIFESTS_FILE := rendered.yaml


start-cluster:
	minikube start -p influx

stop-cluster:
	minikube stop -p influx

render-manifest:
	kustomize build deploy --enable-helm > ${BUILD_DIR}/${RENDERED_MANIFESTS_FILE}

deploy:
	kubectl apply -f ${BUILD_DIR}/${RENDERED_MANIFESTS_FILE}

undeploy:
	kubectl delete -f ${BUILD_DIR}/${RENDERED_MANIFESTS_FILE}

port-forward:
	kubectl -n influxdb-lab port-forward svc/influxdb-lab 8086:8086

write-data:
	scripts/write-data.sh

read-data:
	pipenv run python src/read_data.py
