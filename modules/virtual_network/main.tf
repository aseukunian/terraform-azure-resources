terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

locals {
  module_tags = tomap(
    {
      terraform-module-source = "azurerm/resources/azure//modules/virtual_network"
    }
  )

  tags = merge(
    var.module_tags ? local.module_tags : {},
    var.workload != "" ? { workload = var.workload } : {},
    var.environment != "" ? { environment = var.environment } : {},
    var.tags
  )
}

module "locations" {
  source   = "azurerm/locations/azure"
  location = var.location
}

module "naming" {
  source = "azurerm/naming/azure"
  suffix = [var.workload, var.environment, module.locations.short_name, var.instance]
}

resource "azurerm_virtual_network" "this" {
  name                = coalesce(var.custom_name, module.naming.virtual_network.name)
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  dns_servers = var.dns_servers
  tags        = local.tags
}
