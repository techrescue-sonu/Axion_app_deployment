terraform {
  required_providers {
    azurerm = {
        version = "4.68.0"
        source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}


resource "azurerm_resource_group" "rgs" {
  name = "sonu-axion-rg"
  location = "westus"
}