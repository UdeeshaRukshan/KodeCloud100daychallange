Create a VPC named devops-vpc in us-east-1 region with 192.168.0.0/24 IPv4 CIDR using terraform.

resource "aws_vpc" "devops_vpc" {
  cidr_block           = "192.168.0.0/24"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "devops-vpc"
  }
}
