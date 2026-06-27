variable "rgs" {
    type = map(object({
        name     = string
        location = string
        tags     = map(string)
    }))
}

variable "sas" {
    type = map(object({
        name     = string
        resource_group_name = string
        location = string
        account_tier = string
        account_replication_type = string
        tags     = map(string)
    }))
}


variable "vnets" {
    type = map(object({
        name = string
        resource_group_name      = string
        address_space = list(string)
        location = string
        tags = map(string)
    }))
}

variable "subnets" {
    type = map(object({
        name = string
        resource_group_name      = string
        virtual_network_name = string
        address_prefixes = list(string)
        tags = map(string)
    }))
}

variable "nsgwala" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string

    security_rules = list(object({

      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string

      source_port_range          = string
      destination_port_range     = string

      source_address_prefix      = string
      destination_address_prefix = string

      description = optional(string)

    }))

  }))
}


variable "public_ip" {
  description = "A map of public IP configurations"
  type = map(object({
    name              = string
    allocation_method = string
    resource_group_name = string
    location          = string
  }))
}