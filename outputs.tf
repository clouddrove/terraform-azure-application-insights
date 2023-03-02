output "app_insights_id" {
  value       = join("", azurerm_application_insights.application_insights.*.id)
  description = "The ID of the Application Insights component."
}

output "app_insights_app_id" {
  value       = join("", azurerm_application_insights.application_insights.*.app_id)
  description = "The App ID associated with this Application Insights component."
}

output "instrumentation_key" {
  value       = join("", azurerm_application_insights.application_insights.*.instrumentation_key)
  description = "The Instrumentation Key for this Application Insights component. (Sensitive)"
}

output "connection_string" {
  value       = join("", azurerm_application_insights.application_insights.*.connection_string)
  description = "The Connection String for this Application Insights component. (Sensitive)"
}  