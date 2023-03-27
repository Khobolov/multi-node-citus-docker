# Create Node

containerName=$1
postgresPassword=$2
containerPort=$3

if [ -z "$containerPort" ]
then
  portMapping=""
else
  portMapping="-p $containerPort:5432"
fi

docker run -d \
  --network citus-network \
  --name "$containerName" \
  -e POSTGRES_PASSWORD="$postgresPassword" \
  $portMapping \
  citusdata/citus:11.1

docker exec \
-i $containerName sh \
-c 'head -n -1 var/lib/postgresql/data/pg_hba.conf > var/lib/postgresql/data/pg_hba.conf.new \
&& echo "host all all all trust" >> var/lib/postgresql/data/pg_hba.conf.new \
&& cp var/lib/postgresql/data/pg_hba.conf.new var/lib/postgresql/data/pg_hba.conf \
&& rm var/lib/postgresql/data/pg_hba.conf.new'

docker restart $containerName

echo "$containerName node created!"
