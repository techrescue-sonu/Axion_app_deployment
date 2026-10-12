terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      version = "5.5.0"
      source  = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "sonu-axion-rg"
    storage_account_name = "axionstorageaccountsonu1"
    container_name       = "axion-container"
    key                  = "techrescue.terraform.tfstate"
  }

}



provider "azurerm" {
  features {
  }
}