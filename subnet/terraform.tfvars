subnet_map = {
  snet1 = {
    name                        = "frontend-subnet01"
    azurerm_resource_group_name = "Devops-insider-rg-02"
    virtual_network_name        = "devops-vnet1"
    address_prefixes            = ["10.0.1.0/24"]
  }
  snet2 = {
   name                        = "backend-subnet01"
    azurerm_resource_group_name = "Devops-insider-rg-02"
    virtual_network_name        = "devops-vnet1"
   address_prefixes            = ["10.0.2.0/24"]
  }
}