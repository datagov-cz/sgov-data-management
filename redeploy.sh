#!/bin/bash

echo $CONTEXT

exit


#!/bin/bash
# ./redeploy.sh
#   - redeploys all services of the assembly line
# ./redeploy.sh <SERVICE>
#   - redeploys <SERVICE>, e.g. ./redeploy al-nginx
# ENV_FILE=.env.development ./redeploy.sh <SERVICE>
#   - redeploys <SERVICE>, e.g. ./redeploy dm-ofn-record-manager, using the properties from the .env.development file
ENV_FILE="${ENV_FILE:-.env.local}"
SERVICE="${1:-}"
cat github.auth | docker login -u blcham --password-stdin docker.pkg.github.com
echo "Deploying $SERVICE"
docker-compose --env-file=$ENV_FILE pull $SERVICE
echo "Pulled $SERVICE"
docker-compose --env-file=$ENV_FILE up --force-recreate --build -d $SERVICE
echo "Restarted $SERVICE"