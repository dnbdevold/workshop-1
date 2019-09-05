FROM openjdk
COPY ./files/kafka_2.12-2.3.0.tgz /etc/
WORKDIR /etc/
RUN tar -xzf kafka_2.12-2.3.0.tgz
COPY ./files/config/server.properties /etc/kafka_2.12-2.3.0/config/server.properties
WORKDIR /etc/kafka_2.12-2.3.0
CMD bin/kafka-server-start.sh config/server.properties