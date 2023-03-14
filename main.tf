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

  name                = lower(format("%s-application-insights", module.labels.id))
  resource_group_name = var.resource_group_name
  location            = var.location
  workspace_id        = var.workspace_id
  application_type    = var.application_insights_config
  tags                = module.labels.tags
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  count                          = var.enabled && var.diagnostic_setting_enable ? 1 : 0
  name                           = format("%s-application-insights-diagnostic-log", module.labels.id)
  target_resource_id             = join("", azurerm_application_insights.application_insights.*.id)
  storage_account_id             = var.storage_account_id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = var.log_analytics_destination_type
  metric {
    category = "AllMetrics"
    enabled  = var.Metric_enable
    retention_policy {
      enabled = var.retention_policy_enabled
      days    = var.diagnostic_log_days
    }
  }
  log {
    category       = var.category
    category_group = "AllLogs"
    retention_policy {
      enabled = var.retention_policy_enabled
      days    = var.diagnostic_log_days
    }
    enabled = var.log_enabled
  }
  lifecycle {
    ignore_changes = [log_analytics_destination_type]
  }
}
