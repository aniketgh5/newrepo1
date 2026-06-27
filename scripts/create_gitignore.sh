#!/bin/bash

cat > .gitignore << 'EOF'
# ============================================
# Terraform
# ============================================

# Local .terraform directories
**/.terraform/*
.terraform/

# Terraform state files
*.tfstate
*.tfstate.*

# Crash logs
crash.log
crash.*.log

# Terraform plan files
*.tfplan
*.plan

# Variable files (Sensitive)
terraform.tfvars
terraform.tfvars.json
*.auto.tfvars
*.auto.tfvars.json

# CLI configuration files
.terraformrc
terraform.rc

# Override files
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# Dependency lock file
# Uncomment if you DON'T want to commit it
# .terraform.lock.hcl

# Sensitive files
*.pem
*.key
*.pfx
*.p12

# OS Files
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/

# Logs
*.log

# Temporary files
*.tmp
*.bak
*.swp
EOF

echo "✅ .gitignore created successfully."