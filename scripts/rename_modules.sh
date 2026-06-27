#!/bin/bash

set -e

echo "==========================================="
echo " Renaming Terraform Child Modules"
echo "==========================================="

declare -A MODULES=(
    ["resource-group"]="01-resource-group"
    ["storage-account"]="02-storage-account"
    ["virtual-network"]="03-virtual-network"
    ["subnet"]="04-subnet"
    ["network-security-group"]="05-network-security-group"
    ["public-ip"]="06-public-ip"
    ["network-interface"]="07-network-interface"
    ["linux-vm"]="08-linux-vm"
    ["windows-vm"]="09-windows-vm"
    ["load-balancer"]="10-load-balancer"
    ["application-gateway"]="11-application-gateway"
    ["key-vault"]="12-key-vault"
    ["sql-server"]="13-sql-server"
    ["sql-database"]="14-sql-database"
    ["app-service-plan"]="15-app-service-plan"
    ["app-service"]="16-app-service"
    ["log-analytics"]="17-log-analytics"
    ["monitor"]="18-monitor"
    ["recovery-services-vault"]="19-recovery-services-vault"
)

echo
echo "Renaming module folders..."

for OLD in "${!MODULES[@]}"; do
    NEW="${MODULES[$OLD]}"

    if [ -d "modules/$OLD" ]; then
        mv "modules/$OLD" "modules/$NEW"
        echo "✔ $OLD  ->  $NEW"
    else
        echo "⚠ modules/$OLD not found"
    fi
done

echo
echo "Updating module source paths..."

find environments -type f -name "*.tf" | while read FILE
do
    for OLD in "${!MODULES[@]}"; do
        NEW="${MODULES[$OLD]}"
        sed -i "s|modules/$OLD|modules/$NEW|g" "$FILE"
    done
done

echo
echo "==========================================="
echo " Module renaming completed successfully!"
echo "==========================================="

echo
echo "Run:"
echo "terraform init -reconfigure"