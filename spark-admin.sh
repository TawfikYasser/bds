cd /home/tawfik/Softy/
wget https://dlcdn.apache.org/spark/spark-3.2.1/spark-3.2.1-bin-hadoop3.2.tgz
tar -xvzf spark-3.2.1-bin-hadoop3.2.tgz
cd spark-3.2.1-bin-hadoop3.2/
mv spark-3.2.1-bin-hadoop3.2/ spark-3.2.1/
https://www.python.org/ftp/python/3.7.12/Python-3.7.12.tgz
tar -xvzf Python-3.7.12.tgz
# if needed
sudo killall apt apt-get
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*
sudo dpkg --configure -a
sudo apt update
sudo apt-get install build-essential
####################################
cd /home/tawfik/Softy/Python-3.7.12/
sudo ./configure --enable-optimizations
sudo make altinstall
python3.7 --version
sudo apt-get install python3-pip
pip install pyspark
cd /home/tawfik/Softy/hadoop/sbin
/start-all.sh
cd spark-3.2.1/bin
./pyspark
# In pyspark shell
strings = spark.read.text("file:///home/tawfik/Softy/spark-3.2.1/README.md")
strings.show(10, truncate=False)
exit()
# END
# Spark UI: http://10.0.2.15:4040/jobs/


############# REAL EXAMPLE using Python ##############################
./spark-submit /home/tawfik/Softy/Nov2018Dataset.py

# VSCODE
from os import truncate
from pyspark.sql import SparkSession
from pyspark.sql.functions import *

## CODE_#1
# sparkObj = (
#     SparkSession
#     .builder
#     .appName('Nov2019DataSetProgram')
#     .getOrCreate()
# )
# csv_file = 'file:///home/tawfik/Softy/datatotest.csv'
# df = (
#     sparkObj.read.csv(csv_file)
# )

# df_filtered = (
#     df.select("_c0", "_c1", "_c2", "_c3")
#     .where(col("_c3")  == "50")
# )
# df_filtered.show(10, truncate=False)


sparkObj = (
    SparkSession
    .builder
    .appName('Nov2019DataSetProgram')
    .getOrCreate()
)
csv_file = 'file:///home/tawfik/Softy/2019-Nov.csv'
df = (
    sparkObj.read.csv(csv_file)
)

df_filtered = (
    df.select("_c0", "_c1", "_c2", "_c3", "_c4", "_c5", "_c6", "_c7", "_c8")
    .groupBy("_c3")
    .agg(count("_c3").alias("# of Transactions per Category"))

)
df_filtered.show(1000,truncate=False)
# print(f'Total number of rows returned {df_filtered.count()}')

