./getGenSort.sh
~/GenSort/64/gensort -a 100000000 dataset
ephemeral-hdfs/bin/hadoop dfs -mkdir input
ephemeral-hdfs/bin/hadoop dfs -put dataset input/
spark/bin/spark-submit --master spark://$1:7077 --class spark.terasort.hawk.iit.edu.SparkTeraSort  file:///root/spark-tera-sort-0.0.1-SNAPSHOT.jar spark://$1:7077 hdfs://$1:9000/user/root/input/dataset
mkdir sorted_dataset
ephemeral-hdfs/bin/hadoop dfs -get /user/root/sorted_dataset/* sorted_dataset
sudo yum install -y unix2dos
unix2dos sorted_dataset/*
cd sorted_dataset
~/GenSort/64/valsort -o out0.sum part-00000
~/GenSort/64/valsort -o out1.sum part-00001
~/GenSort/64/valsort -o out2.sum part-00002
~/GenSort/64/valsort -o out3.sum part-00003
cat out0.sum out1.sum out2.sum out3.sum > all.sum
~/GenSort/64/valsort -s all.sum
