# docker-spark-jupyter

Extension of [jupyter/base-notebook][1] with Apache Spark. Intended as base image for simple spark tutorials.

[1]: https://github.com/jupyter/docker-stacks/tree/master/base-notebook


### Running Jupyter and Spark

By default, compose runs jupyter and spark in local mode:

```sh
docker-compose up
```

Visit [localhost:8888](http://localhost:8888).

Start jupyter and spark in cluster mode

```sh
docker-compose -f cluster.yml up
```

Spark cluster web UI: [localhost:8080](http://localhost:8080).

Jupyter Notebook: [localhost:8888](http://localhost:8888).

#### Adding workers to a spark cluster

You can add `workers` running in other machines as follows:  

```sh
docker-compose -f cluster.yml run --rm --service-ports \
    -e "SPARK_PUBLIC_DNS=WORKER_IP" \
    worker spark-class org.apache.spark.deploy.worker.Worker spark://MASTER_IP:PORT
```

Replace `WORKER_IP` with the machine IP running the worker and `MASTER_IP ` with the IP of spark master.



### Forward ports (only for docker toolbox users)

Launch **Docker Quick Start Terminal**. Then, execute:

```sh
./fordward_ports.sh
``` 
This will forward the ports required by jupyter and spark inside VirtualBox `default` VM.

