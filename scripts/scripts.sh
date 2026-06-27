#!/bin/bash

PROJECT_NAME="terraform-infra"

echo "Creating Terraform Generic Module Structure..."

mkdir -p ${PROJECT_NAME}

cd ${PROJECT_NAME} || exit

#######################################
# Root Files
#######################################

touch README.md
touch .gitignore
touch LICENSE

mkdir docs
mkdir scripts

#######################################
# Child Modules
#######################################

MODULES=(
resource-group
virtual-network
subnet
network-security-group
public-ip
network-interface
linux-vm
windows-vm
storage-account
key-vault
app-service-plan
app-service
sql-server
sql-database
load-balancer
application-gateway
log-analytics
recovery-services-vault
monitor
)

mkdir modules

for module in "${MODULES[@]}"
do
    mkdir -p modules/$module

    touch modules/$module/main.tf
    touch modules/$module/variables.tf
    touch modules/$module/outputs.tf
    touch modules/$module/versions.tf
    touch modules/$module/README.md
done

#######################################
# Parent Environments
#######################################

ENVS=(dev test stage prod)

mkdir environments

for env in "${ENVS[@]}"
do
    mkdir -p environments/$env

    touch environments/$env/main.tf
    touch environments/$env/providers.tf
    touch environments/$env/versions.tf
    touch environments/$env/variables.tf
    touch environments/$env/terraform.tfvars
    touch environments/$env/outputs.tf
    touch environments/$env/backend.tf
    touch environments/$env/locals.tf
    touch environments/$env/data.tf

done

#######################################
# Pipeline Folder
#######################################

mkdir -p pipelines

touch pipelines/dev.yml
touch pipelines/test.yml
touch pipelines/stage.yml
touch pipelines/prod.yml

#######################################
# GitHub Actions
#######################################

mkdir -p .github/workflows

touch .github/workflows/terraform-dev.yml
touch .github/workflows/terraform-prod.yml

#######################################
# Example Files
#######################################

cat > .gitignore <<EOF
.terraform/
*.tfstate
*.tfstate.*
terraform.tfvars
*.plan
crash.log
.terraform.lock.hcl
EOF

echo ""
echo "Terraform Generic Module Structure Created Successfully!"