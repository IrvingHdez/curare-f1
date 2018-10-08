##################################################
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## Spark-Jupyter
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##################################################

FROM jupyter/base-notebook
USER root

#-----------------------------------------------------
# Dev Tools
#-----------------------------------------------------
RUN apt-get update && apt-get install -y --no-install-recommends python3-minimal python3 \
	python-pip \
    curl \
    git \
    software-properties-common \
    unzip \
	python3-numpy python3-scipy \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* 

RUN sudo -H pip install --upgrade pip 
RUN python -m pip install pymongo
RUN pip install -U jsonpickle
RUN pip install numpy scipy
RUN python3 -mpip install matplotlib
RUN pip install ipywidgets
RUN jupyter nbextension enable --py widgetsnbextension --sys-prefix
RUN pip install -U textblob
RUN python -m textblob.download_corpora
RUN pip install pandas
RUN pip install plotly
 
#-------------------------------------------------
#-- JAVA 
#-------------------------------------------------
ENV JAVA_VERSION=8
ENV JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-oracle

RUN echo oracle-java${JAVA_VERSION}-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
 && add-apt-repository -y ppa:webupd8team/java \
 &&	apt-get update && apt-get install -y --no-install-recommends oracle-java${JAVA_VERSION}-installer \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /var/cache/oracle-jdk${JAVA_VERSION}-installer
 

#-------------------------------------------------
#-- SPARK
#-------------------------------------------------
ENV SPARK_VERSION=2.2.2 \
    PY4J_VERSION=0.10.4
ENV SPARK_PACKAGE=spark-${SPARK_VERSION}-bin-hadoop2.7
ENV SPARK_HOME=/usr/spark-${SPARK_VERSION}
ENV PATH=${PATH}:${SPARK_HOME}/bin \
    PYTHONPATH=${SPARK_HOME}/python:${SPARK_HOME}/python/lib/py4j-${PY4J_VERSION}-src.zip

	
RUN curl -sL --retry 3 \
  "http://apache.rediris.es/spark/spark-${SPARK_VERSION}/${SPARK_PACKAGE}.tgz" \
  | gunzip \
  | tar x -C /usr/ \
 && mv /usr/${SPARK_PACKAGE} ${SPARK_HOME} \
 && chown -R root:root ${SPARK_HOME}

USER $NB_UID