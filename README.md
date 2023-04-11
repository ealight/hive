# [Docker Hub](https://hub.docker.com/r/ealight/hive/tags)

[![DockerPulls](https://img.shields.io/docker/pulls/ealight/hive.svg)](https://hub.docker.com/r/ealight/hive)
[![DockerStars](https://img.shields.io/docker/stars/ealight/hive.svg)](https://hub.docker.com/r/ealight/hive)

Pull:
```docker pull ealight/hive:2.3.9```

---

# Apache Hive 2.3.9 Docker image

```bash
docker build -t <image-name> .
```

To persist hdfs, hive and Derby:

```bash
docker start -p 10000:10000 -v <volume-name>:usr/local <image-name>
```

With Oracle JDK8 and Hadoop 2.3.9 and Tez 0.9.1.
