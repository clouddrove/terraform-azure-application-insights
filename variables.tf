#Module      : LABEL
#Description : Terraform label module variables.
variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `cluster`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "repository" {
  type        = string
  default     = ""
  description = "Terraform current module repo"
}

variable "business_unit" {
  type        = string
  default     = "Corp"
  description = "Top-level division of your company that owns the subscription or workload that the resource belongs to. In smaller organizations, this tag might represent a single corporate or shared top-level organizational element."
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] ."
}

variable "managedby" {
  type        = string
  default     = "anmol@clouddrove.com"
  description = "ManagedBy, eg 'CloudDrove' or 'AnmolNagpal'."
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)."
}

variable "extra_tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the network security group."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A mapping of tags to assign to the resource."
}

variable "enabled" {
  type        = bool
  description = "Set to false to prevent the module from creating any resources."
  default     = true
}


variable "application_type" {
  type        = string
  default     = "web"
  description = "Required) Specifies the type of Application Insights to create. Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET. Please note these values are case sensitive; unmatched values are treated as ASP.NET by Azure. Changing this forces a new resource to be created."
}


variable "retention_in_days" {
  type        = number
  default     = 90
  description = "Specifies the retention period in days. Possible values are 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90."
}

variable "sampling_percentage" {
  type        = number
  default     = 100
  description = " Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry."
}

variable "daily_data_cap_in_gb" {
  type        = number
  default     = 30
  description = "Specifies the Application Insights component daily data volume cap in GB."
}

variable "web_test_enable" {
  type    = bool
  default = false
}
variable "kind" {
  type    = string
  default = ""
}
variable "frequency" {
  default     = 300
  type        = number
  description = "Interval in seconds between test runs for this WebTest. Default is 300."
}
variable "timeout" {
  default     = 30
  description = "Seconds until this WebTest will timeout and fail. Default is 30."
}
variable "monitored_enabled" {
  type    = bool
  default = true
}
variable "retry_enabled" {
  type        = bool
  default     = true
  description = "Allow for retries should this WebTest fail."
}
variable "description" {
  type        = string
  default     = ""
  description = "Purpose/user defined descriptive test for this WebTest."
}
variable "test_body" {
  default     = "<Request Method=\"GET\" Guid=\"%s\" Version=\"1.1\" Url=\"%s\" ThinkTime=\"0\" Timeout=\"300\" ParseDependentRequests=\"PARSEDEPS\" FollowRedirects=\"True\" RecordResult=\"True\" Cache=\"True\" ResponseTimeGoal=\"0\" Encoding=\"utf-8\" ExpectedHttpStatusCode=\"200\" ExpectedResponseUrl=\"\" ReportingName=\"\" IgnoreHttpStatusCode=\"False\" />"
  description = "WebTest XML Request body.  If overridden, make sure to retain all the string format() parameters needed by the local variable calculations."
  type        = string
}
variable "parse_deps" {
  default     = "false"
  type        =  bool
  description = "Retrieve resources that are linked to by the test URL as part of the web test. Valid values are \"True\" or \"False\". Default value is \"False\"."
}

variable "location" {
  type        = string
  default     = ""
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
}
variable "daily_data_cap_notifications_disabled" {
  type        = bool
  default     = false
  description = "Optional) Specifies if a notification email will be send when the daily data volume cap is met."
}
variable "disable_ip_masking" {
  type        = bool
  default     = false
  description = "By default the real client IP is masked as 0.0.0.0 in the logs. Use this argument to disable masking and log the real client IP. Defaults to false."
}
variable "workspace_id" {
  type        = string
  default     = null
  description = "(Optional) Specifies the id of a log analytics workspace resource. Changing this forces a new resource to be created."
}
variable "application_insights_config" {
  type        = string
  default     = "web"
  description = "Specifies the type of Application Insights to create. Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET. Please note these values are case sensitive; unmatched values are treated as ASP.NET by Azure. Changing this forces a new resource to be created."
}

variable "local_authentication_disabled" {
  type        = bool
  default     = false
  description = "(Optional) Disable Non-Azure AD based Auth. Defaults to false."
}
variable "internet_ingestion_enabled" {
  type        = bool
  default     = false
  description = " (Optional) Should the Application Insights component support ingestion over the Public Internet? Defaults to true."
}
variable "internet_query_enabled" {
  type        = bool
  default     = false
  description = "(Optional) Should the Application Insights component support querying over the Public Internet? Defaults to true."
}
variable "force_customer_storage_for_profiler" {
  type        = bool
  default     = false
  description = "Should the Application Insights component force users to create their own storage account for profiling? Defaults to false."
}
variable "web_test_name" {
  type    = list(string)
  default = []
}
variable "geo_locations" {
  type        = list(string)
  default     = ["us-ca-sjc-azr", "us-tx-sn1-azr", "us-il-ch1-azr", "us-va-ash-azr", "us-fl-mia-edge"]
  description = "Specifies a list of where to physically run the tests from to give global coverage for accessibility of your application."
}

variable "list_of_test_urls" {
  type        = list(string)
  default     = []
  description = "List of URLs to put in the availability tests.  Example: [\"https://test1.example.com\", \"https://test2.example.com/app\"]"
}

variable "header" {
  type    = string
  default = "<WebTest Name=\"WebTest1\" Id=\"%s\" Enabled=\"True\" CssProjectStructure=\"\" CssIteration=\"\" Timeout=\"0\" WorkItemIds=\"\" xmlns=\"http://microsoft.com/schemas/VisualStudio/TeamTest/2010\" Description=\"%s\" CredentialUserName=\"\" CredentialPassword=\"\" PreAuthenticate=\"True\" Proxy=\"default\" StopOnError=\"False\" RecordedResultFile=\"\" ResultsLocale=\"\"><Items>"
}
variable "footer" {
  type    = string
  default = "</Items></WebTest>"
}


#### enable diagnostic setting
variable "log_analytics_destination_type" {
  type        = string
  default     = "AzureDiagnostics"
  description = "Possible values are AzureDiagnostics and Dedicated, default to AzureDiagnostics. When set to Dedicated, logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table."
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
  default = true
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
