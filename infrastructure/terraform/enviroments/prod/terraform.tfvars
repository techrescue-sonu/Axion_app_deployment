rgs = {
  rg1 = {
    name     = "axion-prod-rg"
    location = "west us"
} }
#create resource group
vnets = {
  vnet1 = {
    name                = "axion-prod-vnet"
    location            = "westus"
    resource_group_name = "axion-prod-rg"
    address_space       = ["10.51.0.0/16"]
} }

subnets = {
  tech-frontend = {
    name                 = "prod-frontend-subnet"
    resource_group_name  = "axion-prod-rg"
    virtual_network_name = "axion-prod-vnet"
    address_prefixes     = ["10.51.1.0/24"]
    nsg_name             = "prod-nsg"
  }
  tech-backend = {
    name                 = "prod-backend-subnet"
    resource_group_name  = "axion-prod-rg"
    virtual_network_name = "axion-prod-vnet"
    address_prefixes     = ["10.51.2.0/24"]
    nsg_name             = "prod-nsg"
  }
  tech-database = {
    name                 = "prod-database-subnet"
    resource_group_name  = "axion-prod-rg"
    virtual_network_name = "axion-prod-vnet"
    address_prefixes     = ["10.51.3.0/24"]
    nsg_name             = "prod-nsg"
  }
  tech-bastion = {
    name                 = "AzureBationSubnet"
    resource_group_name  = "axion-prod-rg"
    virtual_network_name = "axion-prod-vnet"
    address_prefixes     = ["10.51.4.0/24"]
    nsg_name             = "prod-nsg"
  }
  tech-application-gate = {
    name                 = "prod-applicationgate-subnet"
    resource_group_name  = "axion-prod-rg"
    virtual_network_name = "axion-prod-vnet"
    address_prefixes     = ["10.51.5.0/24"]
    nsg_name             = "prod-nsg"
  }
}

nics = {
  frontend = {
    name                = "prod-frontend-nic"
    location            = "westus"
    resource_group_name = "axion-prod-rg"
    subnet_id           = "/subscriptions/4df6f95e-c5c2-46f8-b69e-396d7d0ae548/resourceGroups/axion-prod-rg/providers/Microsoft.Network/virtualNetworks/axion-prod-vnet/subnets/prod-frontend-subnet"
    ip_configuration    = "ipconfig1"
    private-ip          = "Dynamic"
  }
  backend = {
    name                = "prod-backend-nic"
    location            = "westus"
    resource_group_name = "axion-prod-rg"
    subnet_id           = "/subscriptions/4df6f95e-c5c2-46f8-b69e-396d7d0ae548/resourceGroups/axion-prod-rg/providers/Microsoft.Network/virtualNetworks/axion-prod-vnet/subnets/prod-backend-subnet"
    ip_configuration    = "ipconfig1"
    private-ip          = "Dynamic"

  }
  database = {
    name                = "prod-database-nic"
    location            = "westus"
    resource_group_name = "axion-prod-rg"
    subnet_id           = "/subscriptions/4df6f95e-c5c2-46f8-b69e-396d7d0ae548/resourceGroups/axion-prod-rg/providers/Microsoft.Network/virtualNetworks/axion-prod-vnet/subnets/prod-database-subnet"
    ip_configuration    = "ipconfig1"
    private-ip          = "Dynamic"
  }
}

vms = {
  frontendvm = {
    name                  = "prod-frontend-vm"
    location              = "westus"
    resource_group_name   = "axion-prod-rg"
    network_interface_ids = ["/subscriptions/4df6f95e-c5c2-46f8-b69e-396d7d0ae548/resourceGroups/axion-prod-rg/providers/Microsoft.Network/networkInterfaces/prod-frontend-nic"]
    vm_size               = "Standard_DC1ds_v3"
    # delete_os_disk_on_termination    = true
    # delete_data_disks_on_termination = true
    computer_name  = "vm-axion-prod-rg"
    admin_username = "azureuser"
    admin_password = "P@ssw0rd123!"
    disabled       = false
  }
  backendvm = {
    name                  = "prod-backend-vm"
    location              = "westus"
    resource_group_name   = "axion-prod-rg"
    network_interface_ids = ["/subscriptions/4df6f95e-c5c2-46f8-b69e-396d7d0ae548/resourceGroups/axion-prod-rg/providers/Microsoft.Network/networkInterfaces/prod-backend-nic"]
    vm_size               = "Standard_DC1ds_v3"
    # delete_os_disk_on_termination    = true
    # delete_data_disks_on_termination = true
    computer_name  = "vm-axion-prod-rg"
    admin_username = "azureuser"
    admin_password = "P@ssw0rd123!"
    disabled       = false
  }
}


pips = {
  pip1 = {
    name                = "prodfrontendpips"
    resource_group_name = "axion-prod-rg"
    location            = "westus"
    allocation_method   = "Static"

} }

nsgs = {
  prod-nsg1 = {
    name                = "prod-nsg"
    location            = "westus"
    resource_group_name = "axion-prod-rg"

    rules = {
      rule1 = {
        rule_name                  = "allow_ssh"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      rule2 = {
        rule_name                  = "allow_http"
        priority                   = 102
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }

      rule3 = {
        rule_name                  = "allow_https"
        priority                   = 103
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
} } } }