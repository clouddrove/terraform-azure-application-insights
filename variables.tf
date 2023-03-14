#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "application" {
  type        = string
  default     = ""
  description = "Application (e.g. `cd` or `clouddrove`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "managedby" {
  type        = string
  default     = "anmol@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove' or 'AnmolNagpal'."
}

variable "label_order" {
  type        = list(any)
  default     = []
  description = "Label order, e.g. `name`,`application`."
}
variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
}

## Common Variables

variable "enabled" {
  type        = bool
  default     = true
  description = "Flag to control the module creation."
}

variable "resource_group_name" {
  type        = string
  default     = ""
  description = "The name of the resource group in which to create the virtual network."
}

variable "location" {
  type        = string
  default     = ""
  description = "Location where resource should be created."
}

# Application Insights

variable "application_insights_config" {
  type        = string
  default     = "web"
  description = "Specifies the type of Application Insights to create. Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET. Please note these values are case sensitive; unmatched values are treated as ASP.NET by Azure. Changing this forces a new resource to be created."
}

variable "workspace_id" {
  type        = string
  default     = null
  description = "Specifies the id of a log analytics workspace resource. Changing this forces a new resource to be created."
}

#### enable diagnostic setting
variable "log_analytics_destination_type" {
  type        = string
  default     = "AzureDiagnostics"
  description = "Possible values are AzureDiagnostics and Dedicated, default to AzureDiagnostics. When set to Dedicated, logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table."
}
variable "retention_policy_enabled" {
  type        = bool
  default     = false
  description = "Is this Retention Policy enabled?"
}
variable "diagnostic_log_days" {
  type        = number
  default     = "90"
  description = " The number of days for which this Retention Policy should apply."
}
variable "Metric_enable" {
  type        = bool
  default     = true
  description = "Is this Diagnostic Metric enabled? Defaults to true."
}
variable "diagnostic_setting_enable" {
  type    = bool
  default = false
}
variable "log_analytics_workspace_id" {
  type    = string
  default = null
}

variable "category" {
  type        = string
  default     = null
  description = " The name of a Diagnostic Log Category Group for this Resource."
}
variable "log_enabled" {
  type        = string
  default     = true
  description = " Is this Diagnostic Log enabled? Defaults to true."
}
variable "storage_account_id" {
  type        = string
  default     = null
  description = "The ID of the Storage Account where logs should be sent."
}
variable "eventhub_name" {
  type        = string
  default     = null
  description = "Specifies the name of the Event Hub where Diagnostics Data should be sent."
}
variable "eventhub_authorization_rule_id" {
  type        = string
  default     = null
  description = "Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data."
}
