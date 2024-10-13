from pyspark.sql import SparkSession

if __name__ == "__main__":
    spark = SparkSession.builder \
        .appName("Read From ScyllaDB") \
        .config("spark.cassandra.connection.host", "localhost") \
        .config("spark.cassandra.connection.port", "9042") \
        .getOrCreate()

    # Read data from the ScyllaDB table
    df = spark.read \
        .format("org.apache.spark.sql.cassandra") \
        .options(keyspace="my_keyspace", table="users") \
        .load()

    # Show the data
    df.show()

    spark.stop()
