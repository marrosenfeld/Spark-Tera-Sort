scp -i spark.pem filesystem.sh root@$1:
scp -i spark.pem target/spark-tera-sort-0.0.1-SNAPSHOT.jar root@$1:
scp -i spark.pem getGenSort.sh root@$1:
scp -i spark.pem run.sh root@$1:
