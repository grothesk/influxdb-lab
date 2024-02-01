# influxdb-lab

Playing around with InfluxDB

## Requirements

* minikube
* kubectl
* kustomize
* helm

## Manage Cluster

Start/create a minikube cluster like this:
```bash
make start-minikube
```

Stop the minikube cluster like this:
```bash
make stop-minikube
```

## Deploy InfluxDB

1. Make changes to [deploy/values.yaml](deploy/values.yaml) acc. to your needs.
2. Render the manifest by:
    ```bash
    make render-manifest
    ```
3. Deploy/update the manifest like this:
    ```bash
    make deploy
    ```

## Accessing the InfluxDB

Expose the InfluxDB to your local machine like this:
```bash
make port-forward
```

Then you can access the UI here: [http://127.0.0.1:8086](http://127.0.0.1:8086).
