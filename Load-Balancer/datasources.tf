

data "azurerm_virtual_network" "devops_vnet" {
  for_each = var.lb_map
  name                = "devops-vnet1"
  resource_group_name = "Devops-insider-rg-02"
}


data "azurerm_network_interface" "nic_01" {
  for_each = var.lb_map
  name                = "nic-vm1"
  resource_group_name = "Devops-insider-rg-02"
}


data "azurerm_network_interface" "nic_02" {
  for_each = var.lb_map
  name                = "nic-vm2"
  resource_group_name = "Devops-insider-rg-02"
}
