firewall_sku                           = "Premium"
private_monitoring                     = true
address_space_spoke_private_monitoring = ["10.100.3.0/27"]
connection_monitor                     = true
update_management                      = true
network_security_group                 = true
backup                                 = true
spokes_count                           = 4