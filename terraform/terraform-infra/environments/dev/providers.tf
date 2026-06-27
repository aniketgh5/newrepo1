terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  } 
}

provider "azurerm" {
  subscription_id = "2e49b68e-27a4-463c-8bb8-a35ef9b4e8cb"
  features {}
}

