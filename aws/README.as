
Amazon Auto Scaling 

Terms
1) auto scaling group: collection of EC2 instances
2) DDoS: Distributed Denial of Service attack via bots acting as clients
3) MinSize: minimum instances per group
4) MaxSize: maximum instances per group
5) DesiredCapacity: ideal instances per group
6) AvailabilityZones: zones with region where instances are started

Usage
1) Combine with CloudWatch to react to defined HWM by auto scaling desired resources up or down.
2) Manage through API or AWS Management Console setting MinSize and MaxSize limits (protection against DDoS)
3) Select multiple AZ for protection from AZ failure

