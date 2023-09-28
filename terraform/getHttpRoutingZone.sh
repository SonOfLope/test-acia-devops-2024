#!/bin/bash
export RESOURCE_GROUP=$(terraform output resource_group_name | xargs)
export CLUSTER_NAME=$(terraform output cluster_name | xargs)

az aks show \
  -g $RESOURCE_GROUP \
  -n $CLUSTER_NAME \
  -o tsv \
  --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName