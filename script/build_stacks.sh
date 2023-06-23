#!/bin/bash

# Configuration File Path
export APP_CONFIG=$1
export PROJECT_STAGE=$(cat $APP_CONFIG | jq -r '.Environment') #ex> development
export SOLUTION_NAME=$(cat $APP_CONFIG | jq -r '.Solution')
export APP_NAME=$(cat $APP_CONFIG | jq -r '.App')

currntPWD=`pwd`
cd ${currntPWD}/source/

echo ==--------CheckDedendencies---------==
aws --version
node --version
npm --version
cdk --version
rush version
pnpm --version
git --version
jq --version

echo ==--------ConfigInfo---------==
echo $APP_CONFIG
echo $AWS_PROFILE
echo $PROJECT_STAGE
echo $SOLUTION_NAME
echo $APP_NAME
echo .
echo .

echo ==--------BuildEnvironment---------==
# rush purge
rush install
rush update
rush rebuild

echo .
echo .

echo "Build Stacks Completed"

exit
