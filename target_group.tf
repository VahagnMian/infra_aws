resource "aws_lb_target_group" "my-target-group" {
   name_prefix = "my"
   port = 80
   protocol = "HTTP"
   target_type = "instance"
   vpc_id = aws_vpc.virginia-vpc.id

   health_check {
     interval            = 10
     port                = 80
     timeout = 5
     protocol            = "HTTP"
     path = "/var/www/html/index.html"
     healthy_threshold   = 3
     unhealthy_threshold = 3
   }

   lifecycle {
     create_before_destroy = true
     ignore_changes = [name]
   }


}




resource "aws_lb_target_group_attachment" "attach-ins-target-1" {
  target_group_arn = aws_lb_target_group.my-target-group.arn
  target_id      = aws_instance.my-webserver-1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach-ins-target-2" {
  target_group_arn = aws_lb_target_group.my-target-group.arn
  target_id      = aws_instance.my-webserver-2.id
  port             = 80
}