#!/bin/bash
filename='slaves'
filelines=`cat $filename`
echo Start
for p in $filelines ; do
  	echo $p:
	scp -i prod.pem raid.sh root@$p:	
	ssh -i prod.pem -t root@$p 'sudo bash raid.sh'
	scp -i prod.pem hdfs-site.xml root@$p:ephemeral-hdfs/conf/
	echo 'adsa'
done

filename='masters'
filelines=`cat $filename`
echo Start
for p in $filelines ; do
        echo $p:
	scp -i prod.pem raid.sh root@$p:

        ssh -i prod.pem root@$p 'sudo bash raid.sh'
        scp -i prod.pem hdfs-site.xml root@$p:ephemeral-hdfs/conf/
done
