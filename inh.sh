# Hadoop Installation, Running, and Administration.

# We will install Hadoop in pseudo-distributed mode [Each component will be on a different JVM]

# Use 'sudo' if you'll work in a directory that is not owned by the effective user only.

# The steps are shown below:

# Installing Java or JDK

# Check if java is already installed
java -version
# If yes, then skip this step
# else: follow the instructions below to install java on # your machine.

sudo wget https://files-cdn.liferay.com/mirrors/download.oracle.com/otn-pub/java/jdk/8u221-b11/jdk-8u221-linux-x64.tar.gz

# Extracting the java files
tar -xvzf jdk-8u221-linux-x64.tar.gz

# Renaming from 'jdk-8u221-linux-x64' to 'java'
mv jdk-8u221-linux-x64 java

# Update the Java environment variables in bashrc
# We can do this using vim, nano, etc.
# In our case we will use 'vim', which is not installed
# on our machine, so we will install it using the       # following command:
sudo apt-get install vim

# Open the bashrc using vim
sudo vim ~/.bashrc
# Scroll to the end of the file, press 'i', then add the # following two lines, press 'Esc', finally, press      # 'Ctrl+z+z'

export JAVA_HOME=../java
export PATH=$PATH:../java/bin

# Run the following commands
sudo update-alternatives --install "/usr/bin/java" "java" "../java/bin/java" 1
sudo update-alternatives --config java
sudo update-alternatives --install "/usr/bin/javac" "javac" "../java/bin/javac" 1
sudo update-alternatives --config javac
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "../java/bin/javaws" 1
sudo update-alternatives --config javaws
sudo update-alternatives --set java ../java/bin/java


# Next we need to configure our SSH for Hadoop
# We will install 'ssh' then you can run the following  # commands

sudo apt-get install ssh
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
sudo apt update
ssh localhost # If it works, type 'exit'

# Download your Hadoop version as the following

wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.1/hadoop-3.3.1.tar.gz
tar -xvzf hadoop-3.3.1.tar.gz 
mv hadoop-3.3.1 hadoop

# Disable ip.6 for the whole system
# by adding the following 3 lines after opening the     # 'sysctl.conf' using vim

sudo vim /etc/sysctl.conf

net.ipv6.conf.all.disable_ipv6=1
net.ipv6.conf.default.disable_ipv6=1
net.ipv6.conf.lo.disable_ipv6=1

# Adding some environment variables for Hadoop

sudo vim ~/.bashrc

# Add the following lines

export HADOOP_HOME=../hadoop
export HADOOP_CONF_DIR=../hadoop/etc/hadoop
export HADOOP_MAPRED_HOME=../hadoop
export HADOOP_COMMON_HOME=../hadoop
export HADOOP_HDFS_HOME=../hadoop
export YARN_HOME=../hadoop
export PATH=$PATH:../hadoop/bin
export PATH=$PATH:../hadoop/sbin
export HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
export HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib"

# Editing some Hadoop configuration files

# File #1
cd ../hadoop/etc/hadoop

sudo vim hadoop-env.sh

# Add the following 4 lines
export HADOOP_OPTS=-Djava.net.preferIPv4Stack=true
export JAVA_HOME=../java
export HADOOP_HOME_WARN_SUPPRESS="TRUE"
export HADOOP_ROOT_LOGGER="WARN,DRFA"

# File #2

sudo vim yarn-site.xml
# Add the following properties

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

# File #3

sudo vim hdfs-site.xml
# Add the following properties

<property>
  <name>dfs.replication</name>
  <value>1</value>
</property>
<property>
<name>dfs.namenode.name.dir</name>
<value>file:../hadoop/yarn_data/hdfs/namenode</value>
</property>
<property>
  <name>dfs.datanode.data.dir</name>
<value>file:../hadoop/yarn_data/hdfs/datanode</value>
</property>

# File #4

sudo vim core-site.xml
# Add the following properties

<property>
  <name>hadoop.tmp.dir</name>
  <value>../hadoop/tmp</value>
</property>
<property>
  <name>fs.defaultFS</name>
  <value>hdfs://localhost</value>
</property>


# File #5

sudo vim mapred-site.xml
# ADD the following
<property>
  <name>mapreduce.framework.name</name>
  <value>yarn</value>
</property>

# Creating directories for tmp, namenode, and datanode

cd ../hadoop # or whereever you want
mkdir -p tmp
mkdir -p ../hadoop/yarn_data/hdfs/namenode
mkdir -p ../hadoop/yarn_data/hdfs/datanode

# Refresh the bashrc
source ~/.bashrc

# Reformating the namenode
hdfs namenode -format

# Starting Hadoop Deamons
cd ../hadoop/sbin
./start-yarn.sh
./start-dfs.sh
# Checking the runnning deamons
jps

# To see (UI):

# 1. Namenode
http://10.0.2.15:9870/
# 2. YARN
http://localhost:8088/
http://10.0.2.15:8042
# 3. Datanodes 
http://10.0.2.15:9864/


# Thanks. 
