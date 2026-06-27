resource "azurerm_virtual_network" "vnet" {
    for_each = var.vnets
    resource_group_name = each.value.resource_group_name
    name = each.value.name
    address_space = each.value.address_space
    location = each.value.location
    tags = each.value.tags

}