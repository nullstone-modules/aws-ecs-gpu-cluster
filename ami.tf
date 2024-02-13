// AWS publishes the latest recommended AMI for Linux ECS Instances
// See https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
data "aws_ssm_parameters_by_path" "ecs_ami" {
  path = local.ssm_path_ami
}

locals {
  ssm_path_ami   = "/aws/service/ecs/optimized-ami/amazon-linux-2/gpu/recommended"
  image_id_index = index(data.aws_ssm_parameters_by_path.ecs_ami.names, "${local.ssm_path_ami}/image_id")
  ami            = nonsensitive(data.aws_ssm_parameters_by_path.ecs_ami.values[local.image_id_index])
}
