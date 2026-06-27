variable "public_ip" {
  description = "A map of public IP configurations"
  type = map(object({
    name              = string
    allocation_method = string
    resource_group_name = string
    location          = string
  }))
}