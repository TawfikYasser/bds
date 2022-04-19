# All commands that are used to work with Hadoop (The Yellow Elephant)
# Hadoop Installation
# We will install hadoop as pseudo-distributed mode [Each component of hadoop will be on a specific JVM]
# The Commands
# Downloading JDK
# Check for java?
java -version
sudo wget https://files-cdn.liferay.com/mirrors/download.oracle.com/otn-pub/java/jdk/8u221-b11/jdk-8u221-linux-x64.tar.gz
sudo tar -xvzf <file-name>
sudo mv <old-name> <new-name>
# Update in env var
sudo apt-get install vim
sudo vim ~/.bashrc #Update Java Home
#Press i, then
export JAVA_HOME=/home/tawfik/Softy/java
export PATH=$PATH:/home/tawfik/Softy/java/bin
#Then Esc, Shift+z+z
sudo update-alternatives --install "/usr/bin/java" "java" "/home/tawfik/Softy/java/bin/java" 1
sudo update-alternatives --config java
sudo update-alternatives --install "/usr/bin/javac" "javac" "/home/tawfik/Softy/java/bin/javac" 1
sudo update-alternatives --config javac
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/home/tawfik/Softy/java/bin/javaws" 1
sudo update-alternatives --config javaws
sudo update-alternatives --set java /home/tawfik/Softy/java/bin/java
######################################################################
#SSH
sudo apt-get install ssh
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
sudo apt update
ssh localhost
# Apache Hadoop Actual Installation
######################################################################
#Running on intelliJ
Launch IntelliJ and click on ‘Create New Project’
Create a java project
Go to File -> Project Structure -> Select Project Module in Modules -> Select Dependencies Tab -> Select ‘+’ in bottom and click Jars or Directories -> Import dependencies from Hadoop installation
For importing dependencies, first select all folders inside ../hadoop- 2.x.x/share/hadoop/
Repeat Step 4 and import ../Hadoop-2.x.x/share/hadoop/common/lib folder
################################################################
sudo wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz
sudo tar -xvzf hadoop-3.3.1.tar.gz 
# Disable ip.6
sudo vim /etc/sysctl.conf #press i, add 3 lines
net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1
######################################################################
#Edit bashrc
sudo vim ~/.bashrc
export HADOOP_HOME=/home/tawfik/Softy/hadoop
export HADOOP_CONF_DIR=/home/tawfik/Softy/hadoop/etc/hadoop
export HADOOP_MAPRED_HOME=/home/tawfik/Softy/hadoop
export HADOOP_COMMON_HOME=/home/tawfik/Softy/hadoop
export HADOOP_HDFS_HOME=/home/tawfik/Softy/hadoop
export YARN_HOME=/home/tawfik/Softy/hadoop
export PATH=$PATH:/home/tawfik/Softy/hadoop/bin
export PATH=$PATH:/home/tawfik/Softy/hadoop/sbin
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"
######################################################################
#Update some conf files for hadoop
cd /home/tawfik/Softy/hadoop/etc/hadoop
sudo vim hadoop-env.sh
# Add 4 lines
export HADOOP_OPTS=-Djava.net.preferIPv4Stack=true
export JAVA_HOME=/home/tawfik/Softy/java
export HADOOP_HOME_WARN_SUPPRESS="TRUE"
export HADOOP_ROOT_LOGGER="WARN,DRFA"
###############################################################
sudo vim yarn-site.xml
# ADD the following
  <configuration>
<!-- Site specific YARN configuration properties -->
  <property>
    <name>yarn.resourcemanager.hostname</name>
    <value>localhost</value>
  </property>
  <property>
    <name>yarn.nodemanager.aux-services.mapreduce.shuffle.class</name>
    <value>org.apache.hadoop.mapreduce.ShuffleHandler</value>
  </property>
  <property>
    <name>yarn.nodemanager.aux-services</name>
    <value>mapreduce_shuffle</value>
  </property>
<property>
        <name>yarn.application.classpath</name>
        <value>
                ${HADOOP_HOME}/etc/*,
                ${HADOOP_HOME}/etc/hadoop/*,
                ${HADOOP_HOME}/lib/*,
                ${HADOOP_HOME}/share/hadoop/common/*,
                ${HADOOP_HOME}/share/hadoop/common/lib/*,
                ${HADOOP_HOME}/share/hadoop/mapreduce/*,
                ${HADOOP_HOME}/share/hadoop/mapreduce/lib-examples/*,
                ${HADOOP_HOME}/share/hadoop/hdfs/*,
                ${HADOOP_HOME}/share/hadoop/hdfs/lib/*,
                ${HADOOP_HOME}/share/hadoop/yarn/*,
                ${HADOOP_HOME}/share/hadoop/yarn/lib/*,
        </value>
</property>
</configuration>
##############################################################  
sudo vim hdfs-site.xml
# ADD the following
  <property>
    <name>dfs.replication</name>
    <value>1</value>
  </property>
    <property>
    <name>dfs.namenode.name.dir</name>
    <value>file:/home/tawfik/Softy/hadoop/yarn_data/hdfs/namenode</value>
  </property>
  <property>
    <name>dfs.datanode.data.dir</name>
    <value>file:/home/tawfik/Softy/hadoop/yarn_data/hdfs/datanode</value>
  </property>
##############################################################  
sudo vim core-site.xml
# ADD the following
<configuration>
<property>
    <name>hadoop.tmp.dir</name>
    <value>/home/tawfik/Softy/hadoop/tmp</value>
  </property>
  <property>
    <name>fs.defaultFS</name>
    <value>hdfs://localhost</value>
  </property>
</configuration>
##############################################################  
sudo vim mapred-site.xml
# ADD the following
<configuration>
  <property>
    <name>mapreduce.framework.name</name>
    <value>yarn</value>
  </property>
</configuration>
######################################################################
# HDFS
cd /home/tawfik/Softy/hadoop
mkdir tmp
mkdir -p /home/tawfik/Softy/hadoop/yarn_data/hdfs/namenode
mkdir -p /home/tawfik/Softy/hadoop/yarn_data/hdfs/datanode
######################################################################
source ~/.bashrc
hdfs namenode -format
jps
cd /home/tawfik/Softy/hadoop/sbin
./start-yarn.sh
./start-dfs.sh
jps
######################################################################
# UI & More
to check dfs namenode: http://10.0.2.15:9870/
to check yarn: http://10.0.2.15:8042
to check dfs datanodes: http://10.0.2.15:9864/
http://localhost:8088/cluster/cluster
######################################################################
*** Running Hadoop Job ****
1. write the code.
2. Generate jar => project strucutre => artifact => make jar => then build tab => choose the jar then buid.
3. hdfs dfs -mkdir /HadoopData [optional if the dir exists].
4. hdfs dfs -put /home/tawfik/Softy/HadoopWork/lab01/data01.txt /HadoopData/data01.txt
5. hadoop jar /home/tawfik/Softy/HadoopWork/lab01/out/artifacts/lab01_jar/lab01.jar /HadoopData/data01.txt /HadoopOuts
######################################################################
-- To see the output: 
EX: hdfs dfs -cat /HadoopOuts/part-r-00000
######################################################################
*** Some useful commands ****
sudo mkdir <name>
sudo wget <link>
hdfs dfs -ls /
hdfs dfs -mkdir <name>
hdfs dfs -copyFromLocal <local-file> <dir-on-hdfs>
