# Apache Hive 3.1.3 Docker image

```bash
docker build -t <image-name> .
```

To persist hdfs, hive and Derby:

```bash
docker start -p 10000:10000 -v <volume-name>:usr/local <image-name>
```

With Oracle JDK8 and Hadoop 3.1.3 and Tez 0.9.1.
