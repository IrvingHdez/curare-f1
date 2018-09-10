# docker-spark-jupyter

Extension of [jupyter/base-notebook][1] with Apache Spark. Intended as base image for simple spark tutorials.

[1]: https://github.com/jupyter/docker-stacks/tree/master/base-notebook

### 1. Install Docker Toolbox for your host OS

Follow the instructions:
* On [MacOS][2]
* On [Windows][3]

[2]: https://docs.docker.com/toolbox/toolbox_install_mac/
[3]: https://docs.docker.com/toolbox/toolbox_install_windows/

NOTE: Configure your port settings in VirtualBox
* Go to your VM's settings -> Network -> Advanced -> Port forwarding
* Add new rule |Protocol: TCP|Host Port:8888|Guest Port:8888| --> Local Jupyter notebook server
* Add new rule |Protocol: TCP|Host Port:4040|Guest Port:4040| --> SparkContext default webUI

### 2. Running Jupyter and Spark

By default, compose runs jupyter and spark in local mode:

```sh
docker-compose up
```

### 3. Open notebook in a web browser

Visit [localhost:8888](http://localhost:8888).

Start jupyter and spark in cluster mode

```sh
docker-compose -f cluster.yml up
```

Spark cluster web UI: [localhost:8080](http://localhost:8080).

Jupyter Notebook: [localhost:8888](http://localhost:8888).

##### Adding workers to a spark cluster

You can add `workers` running in other machines as follows:  

```sh
docker-compose -f cluster.yml run --rm --service-ports \
    -e "SPARK_PUBLIC_DNS=WORKER_IP" \
    worker spark-class org.apache.spark.deploy.worker.Worker spark://MASTER_IP:PORT
```

Replace `WORKER_IP` with the machine IP running the worker and `MASTER_IP ` with the IP of spark master.
