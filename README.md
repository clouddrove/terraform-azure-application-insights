<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AZURE App Insights
</h1>

<p align="center" style="font-size: 1.2rem;">
    Terraform module to create Azure App Insights resource on AZURE.
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/Terraform-v1.1.7-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-APACHE-blue.svg" alt="Licence">
</a>


</p>
<p align="center">

<a href='https://facebook.com/sharer/sharer.php?u=https://github.com/clouddrove/terraform-azure-app-insights'>
  <img title="Share on Facebook" src="https://user-images.githubusercontent.com/50652676/62817743-4f64cb80-bb59-11e9-90c7-b057252ded50.png" />
</a>
<a href='https://www.linkedin.com/shareArticle?mini=true&title=Terraform+AZURE+App+Insights&url=https://github.com/clouddrove/terraform-azure-app-insights'>
  <img title="Share on LinkedIn" src="https://user-images.githubusercontent.com/50652676/62817742-4e339e80-bb59-11e9-87b9-a1f68cae1049.png" />
</a>
<a href='https://twitter.com/intent/tweet/?text=Terraform+AZURE+App+Insights&url=https://github.com/clouddrove/terraform-azure-app-insights'>
  <img title="Share on Twitter" src="https://user-images.githubusercontent.com/50652676/62817740-4c69db00-bb59-11e9-8a79-3580fbbf6d5c.png" />
</a>

</p>
<hr>


We eat, drink, sleep and most importantly love **DevOps**. We are working towards strategies for standardizing architecture while ensuring security for the infrastructure. We are strong believer of the philosophy <b>Bigger problems are always solved by breaking them into smaller manageable problems</b>. Resonating with microservices architecture, it is considered best-practice to run database, cluster, storage in smaller <b>connected yet manageable pieces</b> within the infrastructure.

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

We have [*fifty plus terraform modules*][terraform_modules]. A few of them are comepleted and are available for open source usage while a few others are in progress.




## Prerequisites

This module has a few dependencies:

- [Terraform 1.x.x](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Go](https://golang.org/doc/install)
- [github.com/stretchr/testify/assert](https://github.com/stretchr/testify)
- [github.com/gruntwork-io/terratest/modules/terraform](https://github.com/gruntwork-io/terratest)







## Examples


**IMPORTANT:** Since the `master` branch used in `source` varies based on new modifications, we suggest that you use the release versions [here](https://github.com/clouddrove/terraform-azure-app-insights/releases).


Here are some examples of how you can use this module in your inventory structure:
### azure app insights
```hcl
  # Basic
  module "app-insights" {
  source                             = "terraform/app-insights/azure"
  version                            = "1.0.0"
  name                               = "app"
  environment                        = "test"
  resource_group_name                = module.resource_group.resource_group_name
  location                           = module.resource_group.resource_group_location
  #   workspace_id                   = module.log-analytics.workspace_id
  application_type = "web"

  ##web test
  web_test_enable   = true
  kind              = "ping"
  frequency         = 300
  timeout           = 60
  list_of_test_urls = ["https://www.google.com", ]
  web_test_name     = ["google", ]

  #### enable diagnostic setting
  log_analytics_workspace_id        = module.log-analytics.workspace_id
}
  ```






## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| Metric\_enable | Is this Diagnostic Metric enabled? Defaults to true. | `bool` | `true` | no |
| application\_insights\_config | Specifies the type of Application Insights to create. Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET. Please note these values are case sensitive; unmatched values are treated as ASP.NET by Azure. Changing this forces a new resource to be created. | `string` | `"web"` | no |
| application\_type | Required) Specifies the type of Application Insights to create. Valid values are ios for iOS, java for Java web, MobileCenter for App Center, Node.JS for Node.js, other for General, phone for Windows Phone, store for Windows Store and web for ASP.NET. Please note these values are case sensitive; unmatched values are treated as ASP.NET by Azure. Changing this forces a new resource to be created. | `string` | `"web"` | no |
| attributes | Additional attributes (e.g. `1`). | `list(string)` | `[]` | no |
| business\_unit | Top-level division of your company that owns the subscription or workload that the resource belongs to. In smaller organizations, this tag might represent a single corporate or shared top-level organizational element. | `string` | `"Corp"` | no |
| category | The name of a Diagnostic Log Category Group for this Resource. | `string` | `null` | no |
| daily\_data\_cap\_in\_gb | Specifies the Application Insights component daily data volume cap in GB. | `number` | `30` | no |
| daily\_data\_cap\_notifications\_disabled | Optional) Specifies if a notification email will be send when the daily data volume cap is met. | `bool` | `false` | no |
| description | Purpose/user defined descriptive test for this WebTest. | `string` | `""` | no |
| diagnostic\_log\_days | The number of days for which this Retention Policy should apply. | `number` | `"90"` | no |
| diagnostic\_setting\_enable | n/a | `bool` | `true` | no |
| disable\_ip\_masking | By default the real client IP is masked as 0.0.0.0 in the logs. Use this argument to disable masking and log the real client IP. Defaults to false. | `bool` | `false` | no |
| enabled | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| environment | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| eventhub\_authorization\_rule\_id | Specifies the ID of an Event Hub Namespace Authorization Rule used to send Diagnostics Data. | `string` | `null` | no |
| eventhub\_name | Specifies the name of the Event Hub where Diagnostics Data should be sent. | `string` | `null` | no |
| extra\_tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`). | `map(string)` | `{}` | no |
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
| log\_enabled | Is this Diagnostic Log enabled? Defaults to true. | `string` | `true` | no |
| managedby | ManagedBy, eg 'CloudDrove' or 'AnmolNagpal'. | `string` | `"anmol@clouddrove.com"` | no |
| monitored\_enabled | n/a | `bool` | `true` | no |
| name | Name  (e.g. `app` or `cluster`). | `string` | `""` | no |
| parse\_deps | Retrieve resources that are linked to by the test URL as part of the web test. Valid values are "True" or "False". Default value is "False". | `string` | `"false"` | no |
| repository | Terraform current module repo | `string` | `""` | no |
| resource\_group\_name | The name of the resource group in which to create the network security group. | `string` | n/a | yes |
| retention\_in\_days | Specifies the retention period in days. Possible values are 30, 60, 90, 120, 180, 270, 365, 550 or 730. Defaults to 90. | `number` | `90` | no |
| retention\_policy\_enabled | Is this Retention Policy enabled? | `bool` | `false` | no |
| retry\_enabled | Allow for retries should this WebTest fail. | `bool` | `true` | no |
| sampling\_percentage | Specifies the percentage of the data produced by the monitored application that is sampled for Application Insights telemetry. | `number` | `100` | no |
| storage\_account\_id | The ID of the Storage Account where logs should be sent. | `string` | `null` | no |
| tags | A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
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




## Testing
In this module testing is performed with [terratest](https://github.com/gruntwork-io/terratest) and it creates a small piece of infrastructure, matches the output like ARN, ID and Tags name etc and destroy infrastructure in your AWS account. This testing is written in GO, so you need a [GO environment](https://golang.org/doc/install) in your system.

You need to run the following command in the testing folder:
```hcl
  go test -run Test
```



## Feedback
If you come accross a bug or have any feedback, please log it in our [issue tracker](https://github.com/clouddrove/terraform-azure-app-insights/issues), or feel free to drop us an email at [hello@clouddrove.com](mailto:hello@clouddrove.com).

If you have found it worth your time, go ahead and give us a ★ on [our GitHub](https://github.com/clouddrove/terraform-azure-app-insights)!

## About us

At [CloudDrove][website], we offer expert guidance, implementation support and services to help organisations accelerate their journey to the cloud. Our services include docker and container orchestration, cloud migration and adoption, infrastructure automation, application modernisation and remediation, and performance engineering.

<p align="center">We are <b> The Cloud Experts!</b></p>
<hr />
<p align="center">We ❤️  <a href="https://github.com/clouddrove">Open Source</a> and you can check out <a href="https://github.com/clouddrove">our other modules</a> to get help with your new Cloud ideas.</p>

  [website]: https://clouddrove.com
  [github]: https://github.com/clouddrove
  [linkedin]: https://cpco.io/linkedin
  [twitter]: https://twitter.com/clouddrove/
  [email]: https://clouddrove.com/contact-us.html
  [terraform_modules]: https://github.com/clouddrove?utf8=%E2%9C%93&q=terraform-&type=&language=
