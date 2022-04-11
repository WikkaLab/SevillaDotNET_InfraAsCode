provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "oneresgroup" {
  name     = "sdninfra-tf-rg"
  location = "West Europe"
}

resource "azurerm_service_plan" "aservplan" {
  name                = "sdninfra-tf-sp"
  resource_group_name = azurerm_resource_group.oneresgroup.name
  location            = "West Europe"
  sku_name            = "Free"
}

resource "azurerm_windows_web_app" "awebapp" {
  name                = "sdninfra-tf"
  resource_group_name = azurerm_resource_group.oneresgroup.name
  location            = azurerm_service_plan.aservplan.location
  service_plan_id     = azurerm_service_plan.aservplan.id

  site_config {}
}