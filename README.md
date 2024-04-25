# ECS GPU Cluster

Creates an ECS cluster backed by an EC2 auto-scaling group running GPU instances.

## EC2 Instance Type Quotas

By default, an AWS account prevents launching of "special" EC2 Instance Types including `g5` class (i.e. GPU machines).
See [Amazon EC2 instance type quotas](https://docs.aws.amazon.com/ec2/latest/instancetypes/ec2-instance-quotas.html) for more details.

If you don't change these quotas, a launch of an ECS GPU cluster will error as it relies on `g5.xlarge`.
These can be changed and require a support request to AWS to increase these limits.
Visit [EC2 Quotas](https://console.aws.amazon.com/servicequotas/home/services/ec2/quotas/L-DB2E81BA) in the AWS Web Console to submit a request.
