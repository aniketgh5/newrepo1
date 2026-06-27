module "rgs" {
    source = "../../modules/01-resource-group"
    rgs = var.rgs
}

module "sas" {
    source = "../../modules/02-storage-account"
    storage_accounts = var.sas
    depends_on = [module.rgs]
}

module "vnets" {
    source = "../../modules/03-virtual-network"
    vnets = var.vnets
    depends_on = [module.rgs]
}

module "subnets" {
    source = "../../modules/04-subnet"
    subnets = var.subnets
    depends_on = [module.vnets]
}

module "nsgs" {
    source = "../../modules/05-network-security-group"
    nsgwala = var.nsgwala
    depends_on = [module.rgs]
}

module "public_ip" {
    source = "../../modules/06-public-ip"
    public_ip = var.public_ip
    depends_on = [module.rgs]
}


# output "rg_names" {
#   value = module.rgs.resource_group_name
# }

output "rg_names" {
  value = module.rgs.resource_group_name
}