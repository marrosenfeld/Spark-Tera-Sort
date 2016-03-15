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
		JavaRDD<String> textFile = sc.textFile(args[1]);
		JavaRDD<String> textFileSorted = textFile.sortBy(new Function<String, String>() {
			public String call(String v1) throws Exception {
				return v1.substring(0, 10);
			}
		}, true, 4);

		textFileSorted.saveAsTextFile("sorted_dataset");
		// JavaPairRDD<String, String> map = textFile.mapToPair(new
		// PairFunction<String, String, String>() {
		// public Tuple2<String, String> call(String t) throws Exception {
		// return new Tuple2<String, String>(t.substring(0, 10),
		// t.substring(10));
		// }
		// }).sortByKey();
		//
		// map.map(new Function<Tuple2<String, String>, String>() {
		// public String call(Tuple2<String, String> v1) throws Exception {
		// return v1._1 + v1._2;
		// }
		// }).saveAsTextFile("dataset_sorted");

		long endTime = System.currentTimeMillis();
		System.out.println("End");
		System.out.println("Time taken: " + (endTime - startTime));
	}
}
