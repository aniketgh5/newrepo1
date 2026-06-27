rgs = {
  "rg1" = {
    name    = "dev-ag1"
    location   = "West Europe"
    managed_by = "Terraform"
    tags = {
      environment = "dev"
      project     = "project1"
    }
  }
}

sas = {
  "sa1" = {
    name                     = "devsa19923232"
    resource_group_name      = "dev-ag1"
    location                 = "West Europe"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "dev"
      project     = "project1"
    }
  }
}

vnets = {
  "vnet1" = {
    name = "dev-vnet1"
    address_space = ["10.0.0.0/16"]
    resource_group_name      = "dev-ag1"
    location = "West Europe"
    tags = {
      environment = "dev"
      project     = "project1"
    }
  }
}

subnets = {
  "subnet1" = {
    name = "dev-subnet1"
    resource_group_name      = "dev-ag1"
    virtual_network_name = "dev-vnet1"
    address_prefixes = ["10.0.1.0/24"]
    tags = {
      environment = "dev"
      project     = "project1"
    }
  }
}

nsgwala = {

  nsg1 = {

    name                = "dev-nsg-01"
    location            = "West Europe"
    resource_group_name = "dev-rg"

    security_rules = [

      {
        name                       = "Allow-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"

        source_port_range          = "*"
        destination_port_range     = "80"

        source_address_prefix      = "*"
        destination_address_prefix = "*"

        description = "Allow HTTP"
      }

    ]
  }
}


public_ip = {
  "pip1" = {
    name              = "dev-pip-01"
    allocation_method = "Static"
    resource_group_name = "dev-ag1"
    location          = "West Europe"
  }
}
