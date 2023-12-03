# preset-aws-opensearch-auth-domain
Simple preset for build dashboard using AWS OpenSearch, and load data for dashboard

## Usage

- Python: 3.9.16

## Deploy
It is necessary to create an appropriate HostedZone with Route53 in advance.  
Obtain the ID of the created HostedZone as below:

```bash
aws route53 list-hosted-zones
# {
#   "HostedZones": [
#       {
#           "Id": "/hostedzone/ZXXXXXXXXXXXXX", # 'ZXXXXXXXXXXXXX' is Hosted Zone ID
#           "Name": "example.com.",
#           "CallerReference": "XXXXX",
#           "Config": {
#               "Comment": "HostedZone created by Route53 Registrar",
#               "PrivateZone": false
#           },
#           "ResourceRecordSetCount": 11
#       }
#   ]
# }
```

Then deploy `cloudformation/template` like below:


```bash
make deploy
```

#### Example Parameters

| Parameter | Example |
| --- | --- |
| AllowAddresses | `255.255.255.255/0` |
| CustomDomain | `www.example.com` |
| HostedZoneId | `ZXXXXXXXXXXXXX` |
| MasterUserName | `your.admin01` |
| MasterUserPassword | `Password_01` |
| OpenSearchDomain | `your-opensearch-domain` |

### Setup Role Mapping

> Note: IAM User, or IAM Role ARN is available.

```
PUT _opendistro/_security/api/rolesmapping/all_access
{
  "backend_roles" : [ "arn:aws:iam::123456789012:user/name" ],
  "users" : [ "your.admin01", "arn:aws:iam::123456789012:user/name" ]
}
```
