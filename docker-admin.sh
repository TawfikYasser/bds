# Docker Notebook
https://github.com/ahmedsami76/AraBigData/blob/main/Docker.ipynb
https://github.com/ahmedsami76/AraBigData

## START

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
 
 # Before persmissions 
 sudo dokcer info
 
 # for Manjaro
 $ sudo pacman -Syu
 $ sudo pacman -S docker
$ sudo systemctl start docker.service
$ sudo systemctl enable docker.service
$ sudo docker version
 
 # Check groups
 
 sudo getent group
 docker:x:997:
 
 # Add permissions
 
 groups
 sudo usermod -aG docker tawfik
 sudo getent group
 docker:x:997:tawfik
# restart the machine
groups
docker info


######
# Start using docker

docker image pull fedora
docker image ls
docker container create -it fedora bash
docker container ls -a # show all containers
docker container ls # show running containers
docker container start -i c47 # fedroa id c471f91a7602

cat /etc/*hostname* #show name of the machine inside the container
# c471f91a7602

docker container ls
CONTAINER ID   IMAGE     COMMAND   CREATED         STATUS          PORTS     NAMES
c471f91a7602   fedora    "bash"    4 minutes ago   Up 22 seconds             gifted_cerf


[root@c471f91a7602 /]# cat /etc/*release*
Fedora release 35 (Thirty Five)
NAME="Fedora Linux"
VERSION="35 (Container Image)"
ID=fedora
VERSION_ID=35
VERSION_CODENAME=""
PLATFORM_ID="platform:f35"
PRETTY_NAME="Fedora Linux 35 (Container Image)"
ANSI_COLOR="0;38;2;60;110;180"
LOGO=fedora-logo-icon
CPE_NAME="cpe:/o:fedoraproject:fedora:35"
HOME_URL="https://fedoraproject.org/"
DOCUMENTATION_URL="https://docs.fedoraproject.org/en-US/fedora/f35/system-administrators-guide/"
SUPPORT_URL="https://ask.fedoraproject.org/"
BUG_REPORT_URL="https://bugzilla.redhat.com/"
REDHAT_BUGZILLA_PRODUCT="Fedora"
REDHAT_BUGZILLA_PRODUCT_VERSION=35
REDHAT_SUPPORT_PRODUCT="Fedora"
REDHAT_SUPPORT_PRODUCT_VERSION=35
PRIVACY_POLICY_URL="https://fedoraproject.org/wiki/Legal:PrivacyPolicy"
VARIANT="Container Image"
VARIANT_ID=container
Fedora release 35 (Thirty Five)
Fedora release 35 (Thirty Five)
cpe:/o:fedoraproject:fedora:35


####
[root@c471f91a7602 /]# exit

docker container ls -a
CONTAINER ID   IMAGE     COMMAND   CREATED         STATUS                        PORTS     NAMES
c471f91a7602   fedora    "bash"    6 minutes ago   Exited (127) 19 seconds ago             gifted_cerf


docker image pull python
docker image ls


REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
python       latest    403fd3ce9d68   32 hours ago   919MB

docker container run #(image pull, container create, container start)

docker container ls -a
CONTAINER ID   IMAGE     COMMAND     CREATED          STATUS                       PORTS     NAMES
d37feafe7daf   python    "python3"   11 seconds ago   Up 10 seconds                          condescending_nash

# run with another command
docker container run -it python /bin/bash

root@ec9a3ad4a9c0:/# ls
bin   dev  home  lib64	mnt  proc  run	 srv  tmp  var
boot  etc  lib	 media	opt  root  sbin  sys  usr
root@ec9a3ad4a9c0:/# python3
Python 3.10.4 (main, Apr 14 2022, 04:16:58) [GCC 10.2.1 20210110] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> exit
Use exit() or Ctrl-D (i.e. EOF) to exit
>>> 

root@ec9a3ad4a9c0:/# ps
    PID TTY          TIME CMD
      1 pts/0    00:00:00 bash # the main process, if killed, container will failed
      9 pts/0    00:00:00 ps

root@ec9a3ad4a9c0:/# exit


docker container ls -a
CONTAINER ID   IMAGE     COMMAND       CREATED              STATUS                        PORTS     NAMES
46aacd3ec083   python    "/bin/bash"   About a minute ago   Exited (0) 27 seconds ago               stoic_knuth
ec9a3ad4a9c0   python    "/bin/bash"   5 minutes ago        Exited (0) 3 minutes ago                vigorous_chebyshev
d37feafe7daf   python    "python3"     13 minutes ago       Exited (0) 12 minutes ago               condescending_nash
c471f91a7602   fedora    "bash"        23 minutes ago       Exited (127) 17 minutes ago             gifted_cerf
tawfik@tlinux:~/Softy$ docker container rm 46a ec9 d37
46a
ec9
d37
tawfik@tlinux:~/Softy$ docker container ls -a
CONTAINER ID   IMAGE     COMMAND   CREATED          STATUS                        PORTS     NAMES
c471f91a7602   fedora    "bash"    24 minutes ago   Exited (127) 18 minutes ago             gifted_cerf



docker image ls
REPOSITORY   TAG       IMAGE ID       CREATED        SIZE
python       latest    403fd3ce9d68   33 hours ago   919MB
fedora       latest    b97d90f26110   3 weeks ago    153MB
tawfik@tlinux:~/Softy$ docker image rm python:latest fedora:latest 
Untagged: python:latest
Untagged: python@sha256:ff948edd14a5a045b01205028d90dba91bc65a22bc3b61f4253d553730d1f27a
Deleted: sha256:403fd3ce9d68ce1ac3142d888297b1dbab35c5c38a268f34f4405bd01c9682ea
Deleted: sha256:390082ae4fa4838715b5712efa2b350cb0461db2fc99fc5bafdcb5ec29379509
Deleted: sha256:a3aff4b19621014838c643f849c68f74a662ce303114e7e974741e4672d74241
Deleted: sha256:6b1941550781575f2f9c5f2ba691b4cea6c23fa15d724403f86765cee434adbc
Deleted: sha256:b5dde959ee831ef45d9e8b01b4adae9ceb8aeafbcd98b61e156aba2b6881340e
Deleted: sha256:1bd057c2d4c402985476358b2c08f568321eb91814d8771141714edaa033324c
Deleted: sha256:16e6fa7b9181506daa87d50547960950f91382dc73d80b0eb1406047361637bf
Deleted: sha256:40391edb13fbb7c04f4eb1b2b9b4bca8327fa40296ed8a43625c000be3021a96
Deleted: sha256:9ff1b17252bdb53e8e978d8e4fd42f480396b9890ae4e8a076c5e662c92cb699
Deleted: sha256:4ac8bc2cd0bed27b5d7bcdf724530b8f718618bb2e2b466a70a7136975378bc6
Untagged: fedora:latest
Untagged: fedora@sha256:f1e3a29da8990568c1da6a460cf9658ee7e9b409aa39c2aded67f7ac1dfe7e8a
Deleted: sha256:b97d90f26110930f4ea32c16be938ecac6f85b5b917edf1390e0dcf8f467bd33
Deleted: sha256:5b86cbe1caa031a8d90f13401b67620c51b1f2c6d8e9ed17a074cd8bbe50d837



ps -elf | grep docker
4 S root         847       1  2  80   0 - 345614 -     14:21 ?        00:00:47 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
0 S tawfik      4476    2073  0  80   0 -  2262 pipe_r 15:00 pts/0    00:00:00 grep --color=auto docker

ps -elf | grep containerd
4 S root         761       1  0  80   0 - 354469 -     14:21 ?        00:00:03 /usr/bin/containerd
4 S root         847       1  2  80   0 - 345614 -     14:21 ?        00:00:47 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
0 S tawfik      4478    2073  0  80   0 -  2262 pipe_r 15:01 pts/0    00:00:00 grep --color=auto containerd



# Pull

docker container run -it --name "newname" -h hadoopc asami/hadoop:v1.0 bash -c "/usr/local/bootstrap.sh; bash"

# Info about the image

docker image inspect postgres:13

# Info about the container

docker container inspect 33

# Show ids of images
docker container inspect 33

# Delete all images

docker image rm $(docker image ls -q)

# copy file to container 

docker container cp ./file.py 843:/tmp/file.py

# to call another container from a container using ipAddress
curl http://172.17.0.2

 # add web to hosts file in centos
 docker container run -it --name client --add-host web:172.17.0.2  centos:latest
 curl http://web
 
 
 ###############
 ip link show
 
 # control network
 
 docker container run -it --name <name> --network host <image-name>
 
 # without post 80:080 for example
 docker container run -d  --network host nginx
 http://localhost
 
 # show networks of docker
 docker network ls
 
 # create network
 
 docker network create mynet # bridge by default
 
 # change network for a container 
 
 docker network connect mynet alp2
 
 # change subnet for a network
 
 docker network create --subnet 10.0.0.0/16 mynet2
 docker network connect mynet2 alp2
 
 #disconect a network
 
 docker network disconnect mynet alp2
 
 # create internal network  (inside network only)
 docker network create --internal mynet3
 
 # mounting
 docker container run -it -v /home/tawfik/Softy/docker-work/code:/app/code python
 
 # volume
 docker volume create myvol
 # inspect
 
 {
    "CreatedAt": "2022-04-17T18:55:46+02:00",
    "Driver": "local",
    "Labels": {},
    "Mountpoint": "/var/lib/docker/volumes/myvol/_data",
    "Name": "myvol",
    "Options": {},
    "Scope": "local",
    "CreatedTime": 1650214546000,
    "Containers": {}
}

docker container run -it -v myvol:/app/code python bash 
docker volume ls


# Example to create image from base image

docker container run -it --name pyflask python bash
mkdir /app
cd app/
apt update
apt upgrade -y
apt install vim
vim hello.py
# copy the code to vim

from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return "Flask Hello World"

@app.route('/first_docker')
def firstDocker():
    return "Hello from first docker"


if __name__ == "__main__":
    app.run(debug=False, host='0.0.0.0', port=5000)

# press :wq to save and quit
pip install flask
python hello.py
# running ok
exit #exit from the container

docker commit pyflask twkdocker/pyflask_t:v1.0
docker container run -d -p 5000:5000 --name pyf twkdocker/pyflask_t:v1.0 python /app/hello.py # run the container with the last command + port mapping

# Using Dockerfile

FROM python:latest

WORKDIR /app

# Searching in build context for requirements.txt to current dir ( . ) => /app
COPY requirements.txt .

RUN pip install -r requirements.txt

COPY hello.py .

EXPOSE 5000

# Excueted in run time of the container, the commands are in the image medadata
CMD python hellp.py

# END of Docker file
docker build -t twkdocker/pyflask_t:v1.1 . 
# Each change in a different layer (r/w)
# to run the container using the image generated from Dockerfile
docker container run -d -p 5000:5000 --name pyf_container twkdocker/pyflask_t:v1.1

####################################################################
### DOCKERFILE INSTRUCTIONS
### FROM Instruction
# Add more layers, from the base layer
FROM python
FROM ubuntu:18.04
FROM twkdocker/pyflask_t:v1.2
FROM python@sha256:403fd3ce9d68ce1ac3142d888297b1dbab35c5c38a268f34f4405bd01c9682ea
# Scratch: Image without layers
FROM scratch 

## WORKDIR / ADD / COPY INSTRUCTION
#  pwd or mkdir
WORKDIR /app
# it will consider that subdir is in app
WORKDIR subdir
# Copy from the build context
COPY hello.py /app/subdir/hello.py
COPY *.py /app/
COPY ["name with spaces.py", "/app"]
COPY . /app/

# .dockerignore like .gitignore (e.g. Dockerfile* *.pyc !important.pyc  etc)
# ADD to copy fiile outside the build context
ADD <url> /app
ADD <tar archive> /app/

## SHELL
# to choose the shell
SHELL ["/bin/bash", "-c"]
# Python repl is a shell also
SHELL ["/usr/local/bin/python", "-c"]


## RUN
# Excute commands in the standard shell
# can't work with inputs from the user
RUN <command> <arg1> <arg2>
# The below is better
RUN ["command", "arg1", "arg2"]

RUN echo "This is line" > /tmp/file
RUN echo "This is another" >> /tmp/file
RUN cat /tmp/file
RUN find / -name "python*" | wc -l
RUN pip install flask numpy
RUN apt update && apt upgrade -y
#to debug, see if java installed
RUN java -version
RUN apt install wget vim openssh-server -y

## metadata: no changes in image or runtime, only information to use
# LABEL: found in the inspect
LABEL maintainer="Tawfik"
LABEL description="Hoooo"
LABEL is_dev="true"

## ENV: make effect in image, gloabl for the build, for each intermediate container, even deleted
ENV <name> <value>
ENV SOL_SA_ACCOUNT "sa"
ENV SQL_USER=sa SQL_PASSWORD="P@ssw0rd"
ENV PATH $PATH:/app
ENV PATH="/usr/local/hadoop/bin:${PATH}"
ENV EMPTY ""

## USER for build
# e.g RUN groupadd haddop && useradd -g hadoop hduser
# User hduser
# RUN id


# Entrypoing and CMD while creating the container
## ENTRYPOINT the original command, CMC is the args of entrypoint

ENTRYPOINT [ "/bin/bash", "-c" ]

## CMD

CMD [ "<args for entrypoint>" ]

# ouput e.g. : /bin/bash -c python3

## ARG
# for the Dockerfile
ARG <arg>=<value>
ARG PYTHON_IMAGE_NAME=python
ARG PYTHON_IMAGE_TAG=3.8.17
ARG SQL_SA=sa
ARG SQL_PASSWORD=P@ssw0rd
FROM $PYTHON_IMAGE_NAME:$PYTHON_IMAGE_TAG


########################################################################
#Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
>Docker Compose version v2.2.3
# We need yml file: 
version: '3.5'
services:
  web-fe: #first service
    build: .
    command: python app.py
    container_name: web-fe #ovveride container name
    ports: #port mapping
      - target: 5000
        published: 5000 
    networks:
      - counter-net
    volumes:
      - type: volume
        source: counter-vol
        target: /code
  redis: #second service
    image: 'redis:alpine'
    networks:
      counter-net:
networks:
  counter-net:
volumes:
  counter-vol:

# Dockerfile for compose example
FROM python:3.6-alpine
ADD . /code
WORKDIR /code
RUN pip install -r requirements.txt
CMD ["python", "app.py"]

# requirements for Compose example
flask
redis

# app.py for Compose example
import time
import redis
from flask import Flask

app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)

def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)

@app.route('/')
def hello():
    count = get_hit_count()
    return "What's up Docker Deep Divers! You've visited me {} times.\n".format(count)

if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
    
# To run the .yml file inside the build context
docker-compose up &

# return the output at the end
# run: http://172.21.0.3:5000/
######################################

# Attache shell:  docker exec 7b7 ping -c 1 google.com
# using compose and service name: docker-compose exec redis ping -c 1 google.com

# Show running services
docker-compose ps
 
# To remove the services, networks, but not images and volumes
docker-compose down
# delete images also
docker-compose down rmi

# Changing the network for redis

version: '3.5'
services:
  web-fe: #first service
    build: .
    command: python app.py
    container_name: web-fe
    ports: #port mapping
      - target: 5000
        published: 5000 
    networks:
      - frontend-net
      - backend-net
    volumes:
      - type: volume
        source: counter-vol
        target: /code
  redis: #second service
    image: 'redis:alpine'
    networks:
      backend-net:
networks:
  frontend-net: # for web-fe
  backend-net: # for redis
    internal: true # not for the internet
volumes:
  counter-vol:

docker-compose exec redis ping -c 1 google.com # will not work
#

# Docker Swarm
docker swarm init --advertise-addr 127.0.0.1:2377 --listen-addr 127.0.0.1:2377
Swarm initialized: current node (po7hefewgid47ggfsg6kzp3rc) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-5l3umgvpq7az7koosm4hnc4zd3biysudnbaib3nj03r7fle0af-952bgc7yufikez1ualqyoq7re 127.0.0.1:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

# add worker/manager
docker swarm join-token worker
docker swarm join-token manager

# Go to the new node and run: ex
docker swarm join --token SWMTKN-1-5l3umgvpq7az7koosm4hnc4zd3biysudnbaib3nj03r7fle0af-920bipfsv3496kptr8h3f3ib5 127.0.0.1:2377

# show the nodes in the cluser
docker node ls
ID                            HOSTNAME   STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
po7hefewgid47ggfsg6kzp3rc *   tlinux     Ready     Active         Leader           20.10.14

# Deploy on docker swarm (level of service), can deploy standalone container also on a node, swarm will not take care of it.

docker service create --name web -p 80:80 --replicas 5 nginx:latest
# everything is good, new networks 2 created (ingress, docker_gwbridge)
> verify: Service converged

docker service ls # from a manager not worker

ID             NAME      MODE         REPLICAS   IMAGE          PORTS
lvq0iwhe3iox   web       replicated   5/5        nginx:latest   *:80->80/tcp

# Can see nginx: http://localhost

# info about the replicas
docker service ps web

ID             NAME      IMAGE          NODE      DESIRED STATE   CURRENT STATE           ERROR     PORTS
ru57sz5ss36v   web.1     nginx:latest   tlinux    Running         Running 3 minutes ago             
syknjzxdxq0d   web.2     nginx:latest   tlinux    Running         Running 3 minutes ago             
ekv6rhtqqz33   web.3     nginx:latest   tlinux    Running         Running 3 minutes ago             
xt4acxeg7c2w   web.4     nginx:latest   tlinux    Running         Running 3 minutes ago             
z7eioi10n1ij   web.5     nginx:latest   tlinux    Running         Running 3 minutes ago      

docker service rm web

# starting distribution of services on the workers, then managers
# but the ingress network allow the manager to forward the calling from the manager to the worker contains the service

# change number of replicas 
docker service scale web=1

# To visualize the docker swarm

docker service create \
--name=viz \
--publish=8085:8080/tcp \
--constraint=node.role==manager \
--mount=type=bind,src=/var/run/docker.sock,dst=/var/run/docker.sock \
dockersamples/visualizer

# see the GUI at: http://localhost:8085/

# to update the services, for what version, what service?
# it updates container by container (default)
# parallelism 2: update two containers by two containers
# delay 5s: wait 5 seconds
# old containers will stay, we can remove then
# we can rollback from the last update
docker service update --image nginx:latest --update-parallelism 2 --update-delay 5s webn


# Docker Stack: the code in the repo


########################################################################################
# K8s Installation using minikube

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Cluster manager (kubectl)
sudo snap install kubectl --classic

minikube version
kubectl version

minikube start
minikube dashboard

kubectl get nodes
## K8s commands are in the terminal history, copy them later.
