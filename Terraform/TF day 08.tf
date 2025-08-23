# Provision EC2 instance
resource "aws_instance" "ec2" {
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-08beb420f1ae84254"
  ]

  tags = {
    Name = "nautilus-ec2"
  }
}

# Create an AMI from the existing EC2 instance
resource "aws_ami_from_instance" "nautilus_ec2_ami" {
  name               = "nautilus-ec2-ami"
  source_instance_id = aws_instance.ec2.id
  description        = "AMI created from nautilus-ec2 instance"

  # Optional: Wait until AMI is available
  depends_on = [aws_instance.ec2]
}
