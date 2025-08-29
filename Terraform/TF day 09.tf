resource "aws_ebs_volume" "k8s_volume" {
  availability_zone = "us-east-1a"
  size              = 5
  type              = "gp2"

  tags = {
    Name = "nautilus-vol"
  }
}

# Snapshot of the existing volume
resource "aws_ebs_snapshot" "nautilus_snapshot" {
  volume_id = aws_ebs_volume.k8s_volume.id

  tags = {
    Name = "nautilus-vol-ss"
  }

  description = "Nautilus Snapshot"
}
