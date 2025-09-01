# Example EC2 instance (you can remove this if you already have one)
resource "aws_instance" "example" {
  ami           = "ami-08c40ec9ead489470" # Amazon Linux 2 in us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "datacenter-instance"
  }
}

# CloudWatch alarm
resource "aws_cloudwatch_metric_alarm" "datacenter_alarm" {
  alarm_name          = "datacenter-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300                  # 300 seconds = 5 minutes
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This alarm monitors EC2 CPU utilization and triggers if it exceeds 80%"
  dimensions = {
    InstanceId = aws_instance.example.id
  }
  actions_enabled = false # no action linked, just triggers alarm state
}