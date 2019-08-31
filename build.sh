docker build -t sshakeri/ubuntu:spark_conda -f Docker/Dockerfile_init .
docker build -t sshakeri/ubuntu:java_spark_conda_full -f Docker/Dockerfile_spark_base .
docker build -t sshakeri/ubuntu:jupyter -f Docker/Dockerfile_jupyter .
docker build -t sshakeri/ubuntu:spark_worker -f Docker/Dockerfile_worker .
docker build -t sshakeri/ubuntu:spark_master -f Docker/Dockerfile_master .
docker build -t sshakeri/ubuntu:worker_k8s -f Docker/Dockerfile_worker_k8s .

kubectl create serviceaccount spark
kubectl create clusterrolebinding spark-role --clusterrole=create --serviceaccount=default:spark --namespace=default
kubectl create clusterrolebinding spark-role --clusterrole=create --serviceaccount=default:spark --namespace=default
kubectl get pods | grep -e Error -e CrashLoopBackOff -e Completed -e Pending   | cut -d' ' -f 1 | xargs kubectl delete pod
kubectl port-forward k-pi-1567209324587-driver 4040:4040
kubectl get pods | grep driver |grep Running |cut -d' ' -f 1 | xargs -- bash -c 'kubectl port-forward $0 4040:4040'

for t in sshakeri/ubuntu:spark_conda sshakeri/ubuntu:java_spark_conda_full sshakeri/ubuntu:jupyter sshakeri/ubuntu:spark_worker sshakeri/ubuntu:worker_k8s; do
    docker push "${t}"
done