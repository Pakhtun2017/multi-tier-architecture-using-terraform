resource "aws_launch_template" "this" {
  name          = var.name
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  
  network_interfaces {
    device_index    = 0
    security_groups = [var.security_group_id]
  }

  user_data = filebase64(var.user_data)
  
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = var.instance_name
    }
  }
}

resource "aws_autoscaling_group" "this" {
  name                = var.name
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  target_group_arns   = var.target_group_arns
  health_check_type   = "EC2"
  vpc_zone_identifier = var.subnet_ids
  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

}
