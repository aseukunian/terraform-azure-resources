variable "workload" {
  description = "(Required) The usage or application of the Virtual Network."
  type        = string
  default     = "hub"
}

variable "environment" {
  description = "(Required) The environment of the Virtual Network."
  type        = string
  default     = "prd"
}

variable "location" {
  description = "(Required) The location/region where the Virtual Network is created. Changing this forces a new resource to be created."
  type        = string
}

variable "instance" {
  description = "(Optional) The instance count for the Virtual Network."
  type        = string
  default     = "001"
}

variable "address_space" {
  description = "(Required) The address space that is used the Virtual Network."
  type        = list(string)
}

variable "dns_servers" {
  description = "(Optional) The DNS servers to be used with the Virtual Network."
  type        = list(string)
  default     = null
}

variable "firewall" {
  description = "(Optional) Include a Firewall."
  type        = bool
  default     = true
}

variable "firewall_default_rules" {
  description = "(Optional) Include the default rules for the Firewall."
  type        = bool
  default     = true
}

variable "firewall_sku" {
  description = "(Optional) The SKU of the Firewall."
  type        = string
  default     = "Standard"
}

variable "gateway" {
  description = "(Optional) Include a Gateway."
  type        = bool
  default     = true
}

variable "gateway_type" {
  description = "(Optional) The type of the Gateway."
  type        = string
  default     = "Vpn"
}

variable "gateway_sku" {
  description = "(Optional) The SKU of the Gateway."
  type        = string
  default     = "VpnGw1"
}

variable "bastion" {
  description = "(Optional) Include a Bastion Host."
  type        = bool
  default     = true
}

variable "bastion_sku" {
  description = "(Optional) The SKU of the Bastion Host."
  type        = string
  default     = "Basic"
}

variable "key_vault" {
  description = "(Optional) Include a Key Vault."
  type        = bool
  default     = true
}

variable "module_tags" {
  description = "(Optional) Include the default tags?"
  type        = bool
  default     = true
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = null
}