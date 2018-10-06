FROM ubuntu:cosmic

LABEL os="ubuntu:cosmic" \
  java="openjdk-8-jre" \
  maintainer="Xi Shen <davidshen84@gmail.com>"

RUN apt-get update && apt-get install -y \
  openjdk-8-jdk \
  && rm -rf /var/lib/apt/lists/*

ADD http://www-us.apache.org/dist/spark/spark-2.3.2/spark-2.3.2-bin-hadoop2.7.tgz /opt
RUN mkdir /opt/spark && \
  tar xzf /opt/spark-2.3.2-bin-hadoop2.7.tgz --strip-components=1 -C /opt/spark && \
  rm /opt/spark-2.3.2-bin-hadoop2.7.tgz

COPY root /root
COPY opt /opt

EXPOSE \
  # Master port
  7077 \
  # Master WebUI port
  8080 \
  # Worker WebUI port
  8081

ENTRYPOINT ["/root/startup.sh"]
