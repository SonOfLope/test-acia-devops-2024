# Container management
```bash
docker build -t postgres-vector . 
docker run -e POSTGRES_DB=louis -e POSTGRES_USER=jolopez -e POSTGRES_PASSWORD=stage2024 -e READONLY_USER=ialab -e READONLY_PASSWORD=stage2023 -p 5432:5432 postgres-vector
```

# AZ configuration steps (subscription id 7e349100-77f0-4750-9bff-354325c60926)

## Tenant login
az login --tenant jonathanlopezhotmail.onmicrosoft.com
## Set subscription Sandbox
az account set --subscription "Azure subscription 1"

# Manually create service principal for k8s cluster
az ad sp create-for-rbac --name aks_sp 
# Manually create sp for acr push (gh actions)
```
az ad sp create-for-rbac --name docker_push_sp
az ad sp show --id 68038eaf-b599-46d3-acef-227ebe7ce63b --query id -o tsv
```
Save the output in the variable principal_id under tfvars
# Create execution plan
terraform plan -out main.tfplan
# Apply execution plan
terraform apply main.tfplan
# export kube_config 
export KUBECONFIG="${PWD}/kubeconfig"
# Query HTTPApplicationRoutingZoneName
export RESOURCE_GROUP=$(terraform output resource_group_name | xargs)
export CLUSTER_NAME=$(terraform output cluster_name | xargs)

az aks show \
  -g $RESOURCE_GROUP \
  -n $CLUSTER_NAME \
  -o tsv \
  --query addonProfiles.httpApplicationRouting.config.HTTPApplicationRoutingZoneName