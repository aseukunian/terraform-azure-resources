terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source      = "azurerm/resources/azure//modules/resource_group"
  location    = "westeurope"
  environment = "dev"
  workload    = "example"
  instance    = "001"
}

module "virtual_network" {
  source              = "azurerm/resources/azure//modules/virtual_network"
  resource_group_name = module.resource_group.name
  location            = "westeurope"
  environment         = "dev"
  workload            = "example"
  instance            = "001"
  address_space       = ["10.0.0.0/24"]
}

module "subnet" {
  source              = "azurerm/resources/azure//modules/subnet"
  resource_group_name = module.resource_group.name
  virtual_network_id  = module.virtual_network.id
  name                = "example"
  address_prefixes    = ["10.0.0.0/25"]
}

