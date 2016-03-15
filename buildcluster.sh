#export AWS_ACCESS_KEY_ID=AKIAIWOENUHHC35TNUXQ
#export AWS_SECRET_ACCESS_KEY=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
#chmod 400 /home/mrosenfeld/repo/spark-tera-sort/spark.pem
~/spark-1.6.0-bin-hadoop2.6/ec2/spark-ec2 -k spark -i /home/mrosenfeld/repo/spark-tera-sort/spark.pem -s 8 -t d2.xlarge -r us-west-2 launch Spark --spot-price=0.20

#scp -i filesystem
#scp -i getGenSort
#scp -i spark.pem target/spark-tera-sort-0.0.1-SNAPSHOT.jar  root@ec2-52-35-114-118.us-west-2.compute.amazonaws.com:

#~/spark-1.6.0-bin-hadoop2.6/ec2/spark-ec2 -k rootkey.csv -i spark.pem login Spark -r us-west-2
#ephemeral-hdfs/bin/hadoop dfs -mkdir input
#ephemeral-hdfs/bin/hadoop dfs -put dataset input/
#spark/bin/spark-submit --master spark://ec2-52-35-114-118.us-west-2.compute.amazonaws.com:7077 --class spark.terasort.hawk.iit.edu.SparkTeraSort  file:///root/spark-tera-sort-0.0.1-SNAPSHOT.jar spark://ec2-52-35-114-118.us-west-2.compute.amazonaws.com:7077 hdfs://ec2-52-35-114-118.us-west-2.compute.amazonaws.com:9000/user/root/input/dataset
