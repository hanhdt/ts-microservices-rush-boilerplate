#!/bin/bash

set -e
if [[ "$DEBUG" == "true" ]]; then
  set -x
fi

echo ==--------ConfigInfo---------==
echo $APP_CONFIG
echo $PROJECT_STAGE
echo .
echo .

cwd=$(dirname "$0")
root_dir=$(pwd)

services_root="$root_dir/packages/services"
for service in $(ls $services_root); do
  cd "$services_root/$service"
  if [[ $PROJECT_STAGE == "dev" || $PROJECT_STAGE == "development" ]];
  then
    npm run destroy:dev
  elif [[ $PROJECT_STAGE == "prod" || $PROJECT_STAGE == "production" ]];
  then
    npm run destroy:prod
  else
    echo 'Please check your configuration file'
  fi
done

exit
