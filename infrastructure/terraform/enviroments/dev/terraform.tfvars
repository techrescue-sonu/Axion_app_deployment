rgs = {
  rg1 = {
    name     = "axion-dev-rg"
    location = "west us"
} }
#create resource group
vnets = {
  vnet1 = {
    name                = "axion-dev-vnet"
    location            = "westus"
    resource_group_name = "axion-dev-rg"
    address_space       = ["10.51.0.0/16"]
} }

subnets = {
  tech-frontend = {
    name                 = "dev-frontend-subnet"
    resource_group_name  = "axion-dev-rg"
    virtual_network_name = "axion-dev-vnet"
    address_prefixes     = ["10.51.1.0/24"]
    nsg_name             = "dev-nsg"
  }
  tech-backend = {
    name                 = "dev-backend-subnet"
    resource_group_name  = "axion-dev-rg"
    virtual_network_name = "axion-dev-vnet"
    address_prefixes     = ["10.51.2.0/24"]
    nsg_name             = "dev-nsg"
  }
  tech-database = {
    name                 = "dev-database-subnet"
    resource_group_name  = "axion-dev-rg"
    virtual_network_name = "axion-dev-vnet"
    address_prefixes     = ["10.51.3.0/24"]
    nsg_name             = "dev-nsg"
  }
  tech-bastion = {
    name                 = "AzureBationSubnet"
    resource_group_name  = "axion-dev-rg"
    virtual_network_name = "axion-dev-vnet"
    address_prefixes     = ["10.51.4.0/24"]
    nsg_name             = "dev-nsg"
  }
  tech-application-gate = {
    name                 = "dev-applicationgate-subnet"
    resource_group_name  = "axion-dev-rg"
    virtual_network_name = "axion-dev-vnet"
    address_prefixes     = ["10.51.5.0/24"]
    nsg_name             = "dev-nsg"
  }
}

nics = {
  frontend = {
    name                = "dev-frontend-nic"
    location            = "westus"
    resource_group_name = "axion-dev-rg"
    subnet_id           = "/subscriptions/4df6f95e-c5c2-46f8-b69e-396d7d0ae548/resourceGroups/axion-dev-rg/providers/Microsoft.Network/virtualNetworks/axion-dev-vnet/subnets/dev-frontend-subnet"
    ip_configuration    = "ipconfig1"
    private-ip          = "Dynamic"
  }
  backend = {
    name                = "dev-backend-nic"
    location            = "westus"
    resource_group_name = "axion-dev-rg"
    subnet_id           = "/subscriptions/4df6f95e-c5c2-46f8-b69e-396d7d0ae548/resourceGroups/axion-dev-rg/providers/Microsoft.Network/virtualNetworks/axion-dev-vnet/subnets/dev-backend-subnet"
    ip_configuration    = "ipconfig1"
    private-ip          = "Dynamic"

  }
  database = {
    name                = "dev-database-nic"
    location            = "westus"
    resource_group_name = "axion-dev-rg"
    subnet_id           = "/subscriptions/4df6f95e-c5c2-46f8-b69e-396d7d0ae548/resourceGroups/axion-dev-rg/providers/Microsoft.Network/virtualNetworks/axion-dev-vnet/subnets/dev-database-subnet"
    ip_configuration    = "ipconfig1"
    private-ip          = "Dynamic"
  }
}

vms = {
  frontendvm = {
    name                  = "dev-frontend-vm"
    location              = "westus"
    resource_group_name   = "axion-dev-rg"
    network_interface_ids = ["/subscriptions/4df6f95e-c5c2-46f8-b69e-396d7d0ae548/resourceGroups/axion-dev-rg/providers/Microsoft.Network/networkInterfaces/dev-frontend-nic"]
    vm_size               = "Standard_DC1ds_v3"
    # delete_os_disk_on_termination    = true
    # delete_data_disks_on_termination = true
    computer_name  = "vm-axion-dev-rg"
    admin_username = "azureuser"
    admin_password = "P@ssw0rd123!"
    disabled       = false
  }
  backendvm = {
    name                  = "dev-backend-vm"
    location              = "westus"
    resource_group_name   = "axion-dev-rg"
    network_interface_ids = ["/subscriptions/4df6f95e-c5c2-46f8-b69e-396d7d0ae548/resourceGroups/axion-dev-rg/providers/Microsoft.Network/networkInterfaces/dev-backend-nic"]
    vm_size               = "Standard_DC1ds_v3"
    # delete_os_disk_on_termination    = true
    # delete_data_disks_on_termination = true
    computer_name  = "vm-axion-dev-rg"
    admin_username = "azureuser"
    admin_password = "P@ssw0rd123!"
    disabled       = false
  }
}


pips = {
  pip1 = {
    name                = "devfrontendpips"
    resource_group_name = "axion-dev-rg"
    location            = "westus"
    allocation_method   = "Static"

} }

nsgs = {
  dev-nsg1 = {
    name                = "dev-nsg"
    location            = "westus"
    resource_group_name = "axion-dev-rg"

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