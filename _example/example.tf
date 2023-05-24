provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "clouddrove/resource-group/azure"
  version = "1.0.2"

  name        = "app"
  environment = "test"
  label_order = ["name", "environment"]
  location    = "Canada Central"
}

module "log-analytics" {
  source                           = "clouddrove/log-analytics/azure"
  version                          = "1.0.1"
  name                             = "app"
  environment                      = "test"
  label_order                      = ["name", "environment"]
  create_log_analytics_workspace   = true
  log_analytics_workspace_sku      = "PerGB2018"
  resource_group_name              = module.resource_group.resource_group_name
  log_analytics_workspace_location = module.resource_group.resource_group_location
}

module "application-insights" {
  source              = "clouddrove/application-insights/azure"
  name                = "app"
  environment         = "test"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  #   workspace_id     = module.log-analytics.workspace_id

  ##web test
  web_test_enable   = true
  kind              = "ping"
  frequency         = 300
  timeout           = 60
  list_of_test_urls = ["https://www.google.com", ]
  web_test_name     = ["google", ]

  #### enable diagnostic setting
  log_analytics_workspace_id = module.log-analytics.workspace_id
}
