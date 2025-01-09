## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| Metric\_enable | Is this Diagnostic Metric enabled? Defaults to true. | `bool` | `true` | no |
| application\_type | Required) Specifies the type of Application Insights to create. Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET. Please note these values are case sensitive; unmatched values are treated as ASP.NET by Azure. Changing this forces a new resource to be created. | `string` | `"web"` | no |
| category | The name of a Diagnostic Log Category Group for this Resource. | `string` | `null` | no |
| daily\_data\_cap\_in\_gb | Specifies the Application Insights component daily data volume cap in GB. | `number` | `30` | no |
| daily\_data\_cap\_notifications\_disabled | Optional) Specifies if a notification email will be send when the daily data volume cap is met. | `bool` | `false` | no |
| description | Purpose/user defined descriptive test for this WebTest. | `string` | `""` | no |
| diagnostic\_setting\_enable | n/a | `bool` | `true` | no |
| disable\_ip\_masking | By default the real client IP is masked as 0.0.0.0 in the logs. Use this argument to disable masking and log the real client IP. Defaults to false. | `bool` | `false` | no |
| enabled | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| eventhub\_authorization\_rule\_id | Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. | `string` | `null` | no |
| eventhub\_name | Specifies the name of the Event Hub where Diagnostics Data should be sent. | `string` | `null` | no |
| footer | n/a | `string` | `"</Items></WebTest>"` | no |
| force\_customer\_storage\_for\_profiler | Should the Application Insights component force users to create their own storage account for profiling? Defaults to false. | `bool` | `false` | no |
| frequency | Interval in seconds between test runs for this WebTest. Default is 300. | `number` | `300` | no |
| geo\_locations | Specifies a list of where to physically run the tests from to give global coverage for accessibility of your application. | `list(string)` | <pre>[<br>  "us-ca-sjc-azr",<br>  "us-tx-sn1-azr",<br>  "us-il-ch1-azr",<br>  "us-va-ash-azr",<br>  "us-fl-mia-edge"<br>]</pre> | no |
| header | n/a | `string` | `"<WebTest Name=\"WebTest1\" Id=\"%s\" Enabled=\"True\" CssProjectStructure=\"\" CssIteration=\"\" Timeout=\"0\" WorkItemIds=\"\" xmlns=\"http://microsoft.com/schemas/VisualStudio/TeamTest/2010\" Description=\"%s\" CredentialUserName=\"\" CredentialPassword=\"\" PreAuthenticate=\"True\" Proxy=\"default\" StopOnError=\"False\" RecordedResultFile=\"\" ResultsLocale=\"\"><Items>"` | no |
| internet\_ingestion\_enabled | (Optional) Should the Application Insights component support ingestion over the Public Internet? Defaults to true. | `bool` | `false` | no |
| internet\_query\_enabled | (Optional) Should the Application Insights component support querying over the Public Internet? Defaults to true. | `bool` | `false` | no |
| kind | n/a | `string` | `""` | no |
| label\_order | Label order, e.g. sequence of application name and environment `name`,`environment`,'attribute' [`webserver`,`qa`,`devops`,`public`,] . | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| list\_of\_test\_urls | List of URLs to put in the availability tests.  Example: ["https://test1.example.com", "https://test2.example.com/app"] | `list(string)` | `[]` | no |
| local\_authentication\_disabled | (Optional) Disable Non-Azure AD based Auth. Defaults to false. | `bool` | `false` | no |
| location | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | `""` | no |
| log\_analytics\_destination\_type | Possible values are AzureDiagnostics and Dedicated, default to AzureDiagnostics. When set to Dedicated, logs sent to a Log Analytics workspace will go into resource specific tables, instead of the legacy AzureDiagnostics table. | `string` | `"AzureDiagnostics"` | no |
| log\_analytics\_workspace\_id | n/a | `string` | `null` | no |
| managedby | ManagedBy, eg 'CloudDrove' or 'AnmolNagpal'. | `string` | `"anmol@clouddrove.com"` | no |
| monitored\_enabled | n/a | `bool` | `true` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| parse\_deps | Retrieve resources that are linked to by the test URL as part of the web test. Valid values are "True" or "False". Default value is "False". | `bool` | `"false"` | no |
| repository | Terraform current module repo | `string` | `""` | no |
| resource\_group\_name | The name of the resource group in which to create the network security group. | `string` | n/a | yes |
| retention\_in\_days | Specifies the retention period in days. Possible values are 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90. | `number` | `90` | no |
| retry\_enabled | Allow for retries should this WebTest fail. | `bool` | `true` | no |
| sampling\_percentage | Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry. | `number` | `100` | no |
| storage\_account\_id | The ID of the Storage Account where logs should be sent. | `string` | `null` | no |
| test\_body | WebTest XML Request body.  If overridden, make sure to retain all the string format() parameters needed by the local variable calculations. | `string` | `"<Request Method=\"GET\" Guid=\"%s\" Version=\"1.1\" Url=\"%s\" ThinkTime=\"0\" Timeout=\"300\" ParseDependentRequests=\"PARSEDEPS\" FollowRedirects=\"True\" RecordResult=\"True\" Cache=\"True\" ResponseTimeGoal=\"0\" Encoding=\"utf-8\" ExpectedHttpStatusCode=\"200\" ExpectedResponseUrl=\"\" ReportingName=\"\" IgnoreHttpStatusCode=\"False\" />"` | no |
| timeout | Seconds until this WebTest will timeout and fail. Default is 30. | `number` | `30` | no |
| web\_test\_enable | n/a | `bool` | `false` | no |
| web\_test\_name | n/a | `list(string)` | `[]` | no |
| workspace\_id | (Optional) Specifies the id of a log analytics workspace resource. Changing this forces a new resource to be created. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| app\_insights\_app\_id | The App ID associated with this Application Insights component. |
| app\_insights\_id | The ID of the Application Insights component. |
| connection\_string | The Connection String for this Application Insights component. (Sensitive) |
| instrumentation\_key | The Instrumentation Key for this Application Insights component. (Sensitive) |

