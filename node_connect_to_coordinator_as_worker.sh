# Node connect to coordinator as worker

coordinatorContainerName=$1
workerContainerName=$2

docker exec $coordinatorContainerName bash -c "psql -U postgres -c \"SELECT citus_add_node('$workerContainerName', 5432);\""

echo "$workerContainerName connected to $coordinatorContainerName !"