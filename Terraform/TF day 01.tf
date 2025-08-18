For this task, create a key pair using Terraform with the following requirements:

Name of the key pair should be datacenter-kp.

Key pair type must be rsa.

The private key file should be saved under /home/bob/datacenter-kp.pem.
The Terraform working directory is /home/bob/terraform. Create the main.tf file (do not create a different .tf file) to accomplish this task.

Note: Right-click under the EXPLORER section in VS Code and select Open in Integrated Terminal to launch the terminal.

# TLS provider is required for generating RSA keys
terraform {
  required_providers {
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}

# Generate RSA private key
resource "tls_private_key" "datacenter_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# Create AWS Key Pair
resource "aws_key_pair" "datacenter_kp" {
  key_name   = "datacenter-kp"
  public_key = tls_private_key.datacenter_key.public_key_openssh

  tags = {
    Name        = "datacenter-kp"
    Environment = "migration"
    Project     = "nautilus-aws-migration"
  }
}

# Save private key to local file
resource "local_file" "private_key" {
  content         = tls_private_key.datacenter_key.private_key_pem
  filename        = "/home/bob/datacenter-kp.pem"
  file_permission = "0400"  # Read-only for owner only (secure permissions)
}

# Output the key pair name for verification
output "key_pair_name" {
  description = "Name of the created key pair"
  value       = aws_key_pair.datacenter_kp.key_name
}

# Output the key pair ID
output "key_pair_id" {
  description = "ID of the created key pair"
  value       = aws_key_pair.datacenter_kp.key_pair_id
}

# Output the fingerprint
output "key_fingerprint" {
  description = "Fingerprint of the key pair"
  value       = aws_key_pair.datacenter_kp.fingerprint
}

# Output confirmation of private key file location
output "private_key_location" {
  description = "Location where private key is saved"
  value       = local_file.private_key.filename
}
