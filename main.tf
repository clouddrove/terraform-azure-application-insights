## Managed By : CloudDrove
## Copyright @ CloudDrove. All Right Reserved.

module "labels" {

  source  = "clouddrove/labels/azure"
  version = "1.0.0"

  name        = var.name
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
  repository  = var.repository
}

#Module      : APPLICATION INSIGHTS
#Description : Terraform resource to create a application insights for Azure Environment.
resource "azurerm_application_insights" "application_insights" {
  count = var.enabled == true && var.application_insights_config != null ? 1 : 0

  name                = lower(format("appi-%s", var.name))
  resource_group_name = var.resource_group_name
  location            = var.location
  workspace_id        = var.workspace_id
  application_type    = var.application_insights_config
  tags                = module.labels.tags
}