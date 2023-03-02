provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.0"

  name        = "rg-appi-test"
  environment = "test"
  label_order = ["name", "environment"]
  location    = "Canada Central"
}

module "application-insights" {
  source = "../../"

  name                = "test-app"
  environment         = "test"
  label_order         = ["name", "environment"]
  enabled             = true
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  #   workspace_id     = module.log-analytics.workspace_id
  application_insights_config = "web"
}