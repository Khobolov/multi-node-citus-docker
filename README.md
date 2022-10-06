## Create Citus Cluster with docker
Citus is an open source extension that transforms Postgres into a distributed database. The docker image is based on the official PostgreSQL image.

The benefit of using Citus docker image is that it already has the Citus extention and configuration in Postgre, you don't need to install it

## Deploy citus coordinator with two node

### Create network for containers
`bash network_deploy.sh`

### Create three nodes
`bash node_deploy.sh citus_coordinator 42100`

`bash node_deploy.sh citus_worker_1 42101`

`bash node_deploy.sh citus_worker_2 42102`

### Set a node as coordinator
`bash node_set_as_coordinator.sh citus_coordinator`

### Connect nodes to coordinator
`bash node_connect_to_coordinator_as_worker.sh citus_coordinator citus_worker_1`

`bash node_connect_to_coordinator_as_worker.sh citus_coordinator citus_worker_2`
