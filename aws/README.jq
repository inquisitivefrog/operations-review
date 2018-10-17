
Reference
https://www.systutorials.com/docs/linux/man/1-jq/

Examples
$ aws ec2 describe-availability-zones | jq '.AvailabilityZones[].RegionName'
"us-east-1"
"us-east-1"
"us-east-1"
"us-east-1"
"us-east-1"
"us-east-1"

$ aws ec2 describe-availability-zones | jq '.AvailabilityZones[2]'
{
  "State": "available",
  "Messages": [],
  "RegionName": "us-east-1",
  "ZoneName": "us-east-1c"
}

$ aws ec2 describe-availability-zones | jq '.AvailabilityZones[4:]'
[
  {
    "State": "available",
    "Messages": [],
    "RegionName": "us-east-1",
    "ZoneName": "us-east-1e"
  },
  {
    "State": "available",
    "Messages": [],
    "RegionName": "us-east-1",
    "ZoneName": "us-east-1f"
  }
]

$ aws ec2 describe-availability-zones | jq '.AvailabilityZones[4].ZoneName'
"us-east-1e"

$ aws ec2 describe-availability-zones | jq '.AvailabilityZones[] | select(.ZoneName="us-east-1d").RegionName'
"us-east-1"
"us-east-1"
"us-east-1"
"us-east-1"
"us-east-1"
"us-east-1"

