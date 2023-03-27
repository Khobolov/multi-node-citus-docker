## Create Citus Cluster with docker
Citus is an open source extension that transforms Postgres into a distributed database. The docker image is based on the official PostgreSQL image.

The benefit of using Citus docker image is that it already has the Citus extention and configuration in Postgre, you don't need to install it

## Deploy citus coordinator with two node

### Create network for containers
`bash network_deploy.sh`

### Create three nodes
`bash node_deploy.sh citus-coordinator userpassword 5433`

`bash node_deploy.sh citus-worker-1 userpassword`

`bash node_deploy.sh citus-worker-2 userpassword`

### Set a node as coordinator
`bash node_set_as_coordinator.sh citus-coordinator`

### Connect nodes to coordinator
`bash node_connect_to_coordinator_as_worker.sh citus_coordinator citus_worker_1`

`bash node_connect_to_coordinator_as_worker.sh citus_coordinator citus_worker_2`

### Check active workers
`docker exec citus-coordinator sh -c "psql -U postgres -c \"SELECT * FROM citus_get_active_worker_nodes();\""`