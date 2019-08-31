/opt/spark/bin/spark-submit --master spark://spark-master:7077 --class \
    org.apache.spark.examples.SparkPi \
    /opt/spark/examples/jars/spark-examples_2.11-2.4.3.jar 1000