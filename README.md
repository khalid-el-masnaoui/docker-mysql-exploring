# MYSQL container custom image

## _Custom mysql image with presistent data storage_

Exploring docker by creating custom mysql image with presistent data storage, and mapping the container user UID with the host UID to make shared files (via volumes) accessibles.
The image will init a custom script (inside initScripts folder) to create a database,a table and insert some dummy data.


## MYSQL Configurations :gear:

The MYSQL image under this repository does not use default configs instead it relays on custom configurations. MYSQL is running under mysql user with UID mapped to the host local user's UID


## Docker :hammer_and_wrench:
By default, the Docker will expose ports 3306/tcp for port mappings, so change this within the
Dockerfile if necessary. When ready, simply use the Dockerfile to
build the image.

```sh
cd docker-mysql-exploring
#create logs directory since it is mounted to the container (or you can use --volume instead of --mount option and the logs folder will be created automatically on the local host)
mkdir logs

#image build
docker build . -t cs-mysql -f Dockerfile -build-arg="UID=$(id -u)" --build-arg="GID=$(id -g)"
```

This will create the custom mysql image and pull-in/install the necessary dependencies and extensions.

Once done, run the Docker image and map the port to whatever you wish on
your host. In this example, we simply map port 3306 of the host to
port 3306 of the Docker (or whatever port was exposed in the Dockerfile):

```sh
#running the container container
docker run --rm  -p 3306:3306 --name mysql --mount type=volume,source=mysql-cs-data,destination=/var/lib/mysql --mount type=bind,source=./configurations,destination=/etc/mysql/conf.d --mount type=bind,source=./logs,destination=/var/log/mysql cs-mysql

#the bind mounts are for developement purposes
```

Verify the connection to the msql container server 

```sh
docker exec -it mysql -u root -p
#if all went will - you will be propmpted to enter your password (specified in the Dockerfile)
```

