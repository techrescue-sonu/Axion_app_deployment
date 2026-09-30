rgs = {
  rg1 = {
    name     = "rg-frontend-sonu"
    location = "west us"
  }
  rg2 = {
    name     = "rg-backend-sonu"
    location = "west us"
  }
  rg3 = {
    name     = "rg-database-sonu"
    location = "west us"
  }
}

vnets = {
  vnet1 = {
    name                = "axion-vnet"
    location            = "westus"
    resource_group_name = "rg-frontend-sonu"
    address_space       = ["10.51.0.0/16"]
  }
  # vnet2 = {
  #   name                = "vnet-backend-sonu"
  #   location            = "westus"
  #   resource_group_name = "rg-backend-sonu"
  #   address_space       = ["10.100.0.0/16"]
  # }
  # vnet3 = {
  #   name                = "vnet-database-sonu"
  #   location            = "westus"
  #   resource_group_name = "rg-database-sonu"
  #   address_space       = ["10.150.0.0/16"]
  # }
}

subnets = {
  subnet1 = {
    name                 = "subnet-frontend-sonu"
    resource_group_name  = "rg-frontend-sonu"
    virtual_network_name = "axion-vnet"
    address_prefixes     = ["10.51.1.0/24"]
  }
  subnet2 = {
    name                 = "subnet-backend-sonu"
    resource_group_name  = "rg-frontend-sonu"
    virtual_network_name = "axion-vnet"
    address_prefixes     = ["10.51.2.0/24"]
  }
  subnet3 = {
    name                 = "subnet-database-sonu"
    resource_group_name  = "rg-frontend-sonu"
    virtual_network_name = "axion-vnet"
    address_prefixes     = ["10.51.3.0/24"]
  }
}

nics = {
  nic1 = {
    name                = "nic-frontend-sonu"
    location            = "westus"
    resource_group_name = "rg-frontend-sonu"
    subnet_id           = "/subscriptions/77f0ed07-d387-40be-b398-3146563ac9c2/resourceGroups/rg-frontend-sonu/providers/Microsoft.Network/virtualNetworks/axion-vnet/subnets/subnet-frontend-sonu"
    ip_configuration    = "ipconfig1"
    private-ip          = "Dynamic"
  }
  nic2 = {
    name                = "nic-backend-sonu"
    location            = "westus"
    resource_group_name = "rg-frontend-sonu"
    subnet_id           = "/subscriptions/77f0ed07-d387-40be-b398-3146563ac9c2/resourceGroups/rg-frontend-sonu/providers/Microsoft.Network/virtualNetworks/axion-vnet/subnets/subnet-backend-sonu"
    ip_configuration    = "ipconfig1"
    private-ip          = "Dynamic"
  }
  nic3 = {
    name                = "nic-database-sonu"
    location            = "westus"
    resource_group_name = "rg-frontend-sonu"
    subnet_id           = "/subscriptions/77f0ed07-d387-40be-b398-3146563ac9c2/resourceGroups/rg-frontend-sonu/providers/Microsoft.Network/virtualNetworks/axion-vnet/subnets/subnet-database-sonu"
    ip_configuration    = "ipconfig1"
    private-ip          = "Dynamic"
  }
}

vms = {
  vm1 = {
    name                  = "frontendvmsonu"
    location              = "westus"
    resource_group_name   = "rg-frontend-sonu"
    network_interface_ids = ["/subscriptions/77f0ed07-d387-40be-b398-3146563ac9c2/resourceGroups/rg-frontend-sonu/providers/Microsoft.Network/networkInterfaces/nic-frontend-sonu"]
    vm_size               = "Standard_DC1ds_v3"
    # delete_os_disk_on_termination    = true
    # delete_data_disks_on_termination = true
    computer_name  = "vm-frontend-sonu"
    admin_username = "azureuser"
    admin_password = "P@ssw0rd123!"
    disabled       = false
  }
  pipelineagent1 = {
    name                  = "databasevmsonu"
    location              = "westus"
    resource_group_name   = "rg-frontend-sonu"
    network_interface_ids = ["/subscriptions/77f0ed07-d387-40be-b398-3146563ac9c2/resourceGroups/rg-frontend-sonu/providers/Microsoft.Network/networkInterfaces/nic-backend-sonu"]
    vm_size               = "Standard_DC1ds_v3"
    # delete_os_disk_on_termination    = true
    # delete_data_disks_on_termination = true
    computer_name  = "vm-backend-sonu"
    admin_username = "azureuser"
    # admin_password = "P@ssw0rd123!"
    disabled       = false
  }
  vm3 = {
    name                  = "databasevmsonu"
    location              = "westus"
    resource_group_name   = "rg-frontend-sonu"
    network_interface_ids = ["/subscriptions/77f0ed07-d387-40be-b398-3146563ac9c2/resourceGroups/rg-frontend-sonu/providers/Microsoft.Network/networkInterfaces/nic-database-sonu"]
    vm_size               = "Standard_DC1ds_v3"
    # delete_os_disk_on_termination    = true
    # delete_data_disks_on_termination = true
    computer_name  = "vm-database-sonu"
    admin_username = "azureuser"
    # admin_password = "P@ssw0rd123!"
    disabled       = false
  }

}


pips = {
  pip1 = {
    name                = "frontendpips"
    resource_group_name = "rg-frontend-sonu"
    location            = "westus"
    allocation_method   = "Static"

}
  pip2 = {
    name                = "backendpips"
    resource_group_name = "rg-frontend-sonu"
    location            = "westus"
    allocation_method   = "Static"

}
  pip3 = {
    name                = "databasepips"
    resource_group_name = "rg-frontend-sonu"
    location            = "westus"
    allocation_method   = "Static"

}

}
