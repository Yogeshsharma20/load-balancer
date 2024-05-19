# main.tf

resource "azurerm_public_ip" "lb_pip" {
  for_each = var.lb_map

  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.azurerm_resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_lb" "loadbalancer" {
  for_each = var.lb_map

  name                = each.value.azurerm_lb_name
  location            = each.value.location
  resource_group_name = each.value.azurerm_resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.lb_pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "testlb" {
  for_each = var.lb_map

  loadbalancer_id = azurerm_lb.loadbalancer[each.key].id
  name            = each.value.azurerm_lb_backend_address_pool_name
}

resource "azurerm_lb_backend_address_pool_address" "backendnginx01" {
  for_each = var.lb_map

  name                    = "app1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.testlb[each.key].id
  virtual_network_id      = data.azurerm_virtual_network.devops_vnet[each.key].id
  ip_address              = data.azurerm_network_interface.nic_01[each.key].private_ip_address
}

resource "azurerm_lb_backend_address_pool_address" "backendnginx02" {
  for_each = var.lb_map

  name                    = "app2"
  backend_address_pool_id = azurerm_lb_backend_address_pool.testlb[each.key].id
  virtual_network_id      = data.azurerm_virtual_network.devops_vnet[each.key].id
  ip_address              = data.azurerm_network_interface.nic_02[each.key].private_ip_address
}
resource "azurerm_lb_probe" "example" {
  for_each = var.lb_map

  loadbalancer_id = azurerm_lb.loadbalancer[each.key].id
  name            = "ssh-running-probe"
  port            = 22
}

resource "azurerm_lb_rule" "testlb_rule" {
  for_each = var.lb_map

  loadbalancer_id                = azurerm_lb.loadbalancer[each.key].id
  name                           = "LBRule-TestLB"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = each.value.frontend_ip_configuration_name
  backend_address_pool_ids = [ azurerm_lb_backend_address_pool.testlb[each.key].id ]
  probe_id = azurerm_lb_probe.example[each.key].id
}