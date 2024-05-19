linux_vms = {
  vm1 = {
    pip_name            = "Publicip-vm1"  
    resource_group_name = "Devops-insider-rg-02"
    location            = "East US"
    nic_name            = "frontend-nic01"
    vm_name             = "Frontend-machine-01"
    vm_size             = "Standard_DS1_v2"
    vm_username         = "devopsinsider"
    vm_password         = "Admin1234567"
  }
  
  vm2 = {
    pip_name            = "Publicip-vm2"  
    resource_group_name = "Devops-insider-rg-02"
    location            = "East US"
    nic_name            = "frontend-nic02"
    vm_name             = "Frontend-machine-02"
    vm_size             = "Standard_DS1_v2"
    vm_username         = "devopsinsider"
    vm_password         = "Admin1234567"
  }
}


