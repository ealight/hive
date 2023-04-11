# [Docker Hub](https://hub.docker.com/r/ealight/hive)

[![DockerPulls](https://img.shields.io/docker/pulls/ealight/hive.svg)](https://hub.docker.com/r/ealight/hive)
[![DockerStars](https://img.shields.io/docker/stars/ealight/hive.svg)](https://hub.docker.com/r/ealight/hive)

Pull:
```docker pull ealight/hive:3.1.3```

---

# Apache Hive 3.1.3 Docker image

```bash
docker build -t <image-name> .
```

To persist hdfs, hive and Derby:

```bash
docker start -p 10000:10000 -v <volume-name>:usr/local <image-name>
```

With Oracle JDK8 and Hadoop 3.1.3 and Tez 0.9.1.

---

### Main branch contains Hive 3.1.3 image. Other versions are available in other branches.


