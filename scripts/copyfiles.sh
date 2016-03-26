scp -i prod.pem raid.sh root@$1:
scp -i prod.pem target/spark-tera-sort-0.0.1-SNAPSHOT.jar root@$1:
scp -i prod.pem getGenSort.sh root@$1:
scp -i prod.pem run.sh root@$1:
