# Zookeeper Installation

wget https://archive.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
tar -xvzf zookeeper-3.4.6.tar.gz
mv zookeeper-3.4.6 zookeeper
cat > zookeeper/conf/zoo.cfg << EOF
> tickTime=2000
> dataDir=/home/tawfik/Softy/zkData
> clientPort=2181
> EOF
export JAVA_HOME
zookeeper/bin/zkServer.sh start
telnet localhost 2181

# Kafka Installation

sudo wget https://dlcdn.apache.org/kafka/3.2.0/kafka_2.13-3.2.0.tgz
tar -xzvf kafka_2.12-3.1.0.tgz
mv kafka_2.12-3.1.0 kafka
mkdir kafka-logs
export JAVA_HOME
cd kafka/bin
./kafka-server-start.sh /home/tawfik/Apps/kafka/config/server.properties
./kafka/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic test
./kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic test
./kafka/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test
>Test Message 1
>Test Message 2
>^C
./kafka/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning
Test Message 1
Test Message 2
^C
Processed a total of 2 messages
