# Save private key locally (optional but useful for SSH)
resource "local_file" "private_key" {
  content  = tls_private_key.devops_key.private_key_pem
  filename = "${path.module}/devops-kp.pem"
  file_permission = "0400"
}

# Launch EC2 Instance
resource "aws_instance" "devops_ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.devops_kp.key_name

  # Attach default security group
  vpc_security_group_ids = [data.aws_security_group.default.id]

  tags = {
    Name = "devops-ec2"
  }
}

# Get default VPC security group
data "aws_security_group" "default" {
  name   = "default"
  vpc_id = data.aws_vpc.default.id
}

# Get default VPC
data "aws_vpc" "default" {
  default = true
}