# Apache Hive 2.3.9 Docker image

```bash
docker build -t <image-name> .
```

To persist hdfs, hive and Derby:

```bash
docker start -p 10000:10000 -v <volume-name>:usr/local <image-name>
```

With Oracle JDK8 and Hadoop 2.3.9 and Tez 0.9.1.
