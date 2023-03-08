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
  source = "../"

  name                = "app"
  environment         = "test"
  label_order         = ["name", "environment", ]
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.resource_group_location
  #   workspace_id     = module.log-analytics.workspace_id
  application_type     = "web"
  daily_data_cap_in_gb = 30

  ##web test
  web_test_enable   = false
  kind              = "ping"
  frequency         = 300
  timeout           = 60
  monitored_enabled = true
  retry_enabled     = true
  geo_locations     = ["us-ca-sjc-azr", "us-tx-sn1-azr", "us-il-ch1-azr", "us-va-ash-azr", "us-fl-mia-edge"]
  list_of_test_urls = ["https://www.google.com", ]
  web_test_name     = ["google", ]
}
