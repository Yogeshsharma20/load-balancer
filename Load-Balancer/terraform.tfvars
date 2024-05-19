



lb_map = {
  lb = {
    pip_name                             = "Public_ip"
    azurerm_lb_name                      = "testlb"
    location                             = "East US"
    azurerm_resource_group_name          = "Devops-insider-rg-02"
    frontend_ip_configuration_name       = "frontend-ip"
    azurerm_lb_backend_address_pool_name = "BackEndAddressPool"
    sku                                  = "Standard"
    backend_ips                          = ["10.0.1.4", "10.0.1.5"]
  }
}
