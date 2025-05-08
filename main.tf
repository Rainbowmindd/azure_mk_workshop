terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}
provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-user6" #change here
    storage_account_name = "user6azureglobal2025" #change here
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_service_plan" "example" {
  name                = "martyna-service-plan" #change here
  location            = "westeurope" #change here
  resource_group_name = "rg-user6" #change here
  os_type             = "Linux"
  sku_name            = "P0v3"
}


resource "azurerm_linux_web_app" "example" {
  name                = "martyna-example-webapp" #change here
  location            = "westeurope" #change here
  resource_group_name = "rg-user6" #change here
  service_plan_id     = azurerm_service_plan.example.id
  site_config {}
}
