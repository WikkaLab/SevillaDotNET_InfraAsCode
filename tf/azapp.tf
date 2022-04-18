provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "oneresgroup" {
  name     = "sdninfra-tf-rg"
  location = "West Europe"
}

resource "azurerm_service_plan" "aservplan" {
  name                = "sdn-asp"
  resource_group_name = "sdn-rg"
  location            = "West Europe"
  sku_name            = "Free"
}

resource "azurerm_windows_web_app" "awebapp" {
  name                = "sdninfra-tf"
  resource_group_name = "sdn-rg"
  location            = azurerm_service_plan.aservplan.location
  service_plan_id     = azurerm_service_plan.aservplan.id

  site_config {}
}