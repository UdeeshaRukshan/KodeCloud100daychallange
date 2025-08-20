
resource "aws_eip" "devops_eip" {
  vpc = true
  tags = {
    Name = "devops-eip"
  }
}