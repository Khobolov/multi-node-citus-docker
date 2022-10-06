# Create Node

containerName=$1
containerPort=$2

docker run -d --network citus-network --name $containerName -p $containerPort:5432 -e POSTGRES_PASSWORD=mypassword citusdata/citus:11.1
docker exec $containerName bash -c "apt-get update > /dev/null 2>&1 && apt-get install sudo > /dev/null 2>&1"
docker exec $containerName bash -c "sudo head -n -1 var/lib/postgresql/data/pg_hba.conf > var/lib/postgresql/data/temp.conf; sudo mv var/lib/postgresql/data/temp.conf var/lib/postgresql/data/pg_hba.conf"
docker exec $containerName bash -c "sudo echo -e \"host all all all trust\" >> var/lib/postgresql/data/pg_hba.conf"

docker restart $containerName

echo "$containerName node created!"