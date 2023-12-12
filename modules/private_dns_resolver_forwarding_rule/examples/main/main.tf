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

module "private_dns_resolver" {
  source              = "azurerm/resources/azure//modules/private_dns_resolver"
  resource_group_name = module.resource_group.name
  location            = "westeurope"
  environment         = "dev"
  workload            = "example"
  instance            = "001"
}

module "private_dns_resolver_dns_forwarding_ruleset" {
  source              = "azurerm/resources/azure//modules/private_dns_resolver_dns_forwarding_ruleset"
  resource_group_name = module.resource_group.name
  name                = "example"
  private_dns_resolver_outbound_endpoint_ids = [
    module.private_dns_resolver_dns_forwarding_outbound_endpoint.id,
  ]
}

module "private_dns_resolver_forwarding_rule" {
  source                                         = "azurerm/resources/azure//modules/private_dns_resolver_forwarding_rule"
  resource_group_name                            = module.resource_group.name
  private_dns_resolver_dns_forwarding_ruleset_id = module.private_dns_resolver_dns_forwarding_ruleset.id
  domain_name                                    = "example.com"
  forwarding_endpoint_ip_addresses = [{
    ip_address = "10.0.0.4"
    port       = 53
  }]
}