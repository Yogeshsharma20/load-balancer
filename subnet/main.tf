
resource "azurerm_subnet" "subnet" {
  for_each = var.subnet_map

  name                 = each.value.name
  resource_group_name  = each.value.azurerm_resource_group_name 
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes
}