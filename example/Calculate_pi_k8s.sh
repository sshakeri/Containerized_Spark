!/opt/spark/bin/spark-submit \
--master k8s://https://192.168.65.3:6443 \
--deploy-mode cluster\
--name cluster-pi \
--class org.apache.spark.examples.SparkPi \
--conf spark.executor.instances=5 \
--conf spark.kubernetes.container.image=sshakeri/ubuntu:worker_k8s \
--conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
/opt/spark/examples/jars/spark-examples_2.11-2.4.3.jar 1000 