#!/bin/bash
# set subnet, security groups, public ip
SERVICE_NAME=$1
CLUSTER_NAME=$1
NETWORK_CONFIGURATION=$(aws ecs describe-services --services $SERVICE_NAME --cluster $CLUSTER_NAME |jq -r '.services[].networkConfiguration')
SUBNETS=$(echo $NETWORK_CONFIGURATION |jq '.awsvpcConfiguration.subnets[]' | tr '\n' ',' | sed 's/.$//')
SECURITY_GROUPS=$(echo $NETWORK_CONFIGURATION |jq '.awsvpcConfiguration.securityGroups[]' | tr '\n' ',' | sed 's/.$//')
PUBLIC_IP=$(echo $NETWORK_CONFIGURATION |jq '.awsvpcConfiguration.assignPublicIp')
sed -i 's/$SUBNETS/'$SUBNETS'/' appspec.yaml
sed -i 's/$SECURITY_GROUPS/'$SECURITY_GROUPS'/' appspec.yaml
sed -i 's/$PUBLIC_IP/'$PUBLIC_IP'/' appspec.yaml
