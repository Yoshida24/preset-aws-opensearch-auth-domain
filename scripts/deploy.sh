#!/usr/bin/env bash

# exit on error
set -e

# load .env
set -a
source .env
set +a

STACK_NAME=${STACK_NAME}

aws cloudformation deploy \
  --stack-name ${STACK_NAME} \
  --template cloudformation/template.yaml \
  --parameter-overrides \
    OpenSearchDomain=${OpenSearchDomain} \
    CustomDomain=${CustomDomain} \
    HostedZoneId=${HostedZoneId} \
    MasterUserName=${MasterUserName} \
    MasterUserPassword=${MasterUserPassword} \
    AllowAddresses=${AllowAddresses} \
  --capabilities CAPABILITY_NAMED_IAM
