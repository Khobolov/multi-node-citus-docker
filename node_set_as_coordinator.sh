# Node set as coordinator

containerName=$1

docker exec $containerName bash -c "psql -U postgres -c \"SELECT citus_set_coordinator_host('$containerName', 5432);\""

echo "$containerName setted as coordinator"