#Find the last error log on spark workers
rm -rf /spark/work
cat $(find /spark/work -type f -name stderr -exec stat -c '%X %n' {} \; | sort -nr | awk 'NR==1,NR==1 {print $2}')

worker=hostname
Spark Executor Command:
 "/usr/local/openjdk-8/bin/java" "-cp" 
 "/spark/conf/:/spark/jars/*" "-Xmx1024M" 
 "-Dspark.driver.port=37843" 
 "org.apache.spark.executor.CoarseGrainedExecutorBackend" 
 "--driver-url" "spark://CoarseGrainedScheduler@jupyter:37843" 
 "--executor-id" "7" 
 "--hostname" "172.18.0.3" "--cores" "1"
  "--app-id" "app-20190829033801-0000"
   "--worker-url" "spark://Worker@172.18.0.3:42999"

   Launch command:
 "-Dspark.driver.port=42131" 
 "org.apache.spark.executor.CoarseGrainedExecutorBackend"
  "--driver-url" "spark://CoarseGrainedScheduler@spark-jupyter-7d784b6fcb-ccxjz:42131" "--executor-id" "32"
   "--hostname" "10.1.1.39" "--cores" "1" "--app-id" "app-20190829034551-0000" 
   "--worker-url" "spark://Worker@10.1.1.39:33621"