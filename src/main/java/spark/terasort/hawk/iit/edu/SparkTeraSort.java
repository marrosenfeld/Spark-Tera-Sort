package spark.terasort.hawk.iit.edu;

import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.Function;

public class SparkTeraSort {
	public static void main(String[] args) {

		SparkConf conf = new SparkConf().setAppName("Spark TeraSort").setMaster(args[0]);

		JavaSparkContext sc = new JavaSparkContext(conf);
		sc.hadoopConfiguration().set("dfs.replication", "1");
		long startTime = System.currentTimeMillis();
		JavaRDD<String> textFile = sc.textFile(args[1], 16);
		JavaRDD<String> textFileSorted = textFile.sortBy(new Function<String, String>() {
			public String call(String v1) throws Exception {
				return v1.substring(0, 10);
			}
		}, true, 16);

		textFileSorted.saveAsTextFile("sorted_dataset");

		long endTime = System.currentTimeMillis();
		System.out.println("End");
		System.out.println("Time taken: " + (endTime - startTime));
	}
}
