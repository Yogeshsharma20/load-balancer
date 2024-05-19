data "azurerm_subnet" "frontend_subnet" {
  name                 = "frontend-subnet01"
  virtual_network_name = "devops-vnet1"
  resource_group_name  = "Devops-insider-rg-02"

}
