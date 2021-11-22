resource "aws_lb" "my-app-loadbalancer" {
    name = "my-loadbalancer"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.webserver-sg.id]
    subnets = "${data.aws_subnet.az_subnet.*.id}"

    enable_deletion_protection = false


    
  
}


resource "aws_lb_listener" "my-listener" {
    load_balancer_arn = aws_lb.my-app-loadbalancer.arn
    port = "80"
    protocol = "HTTP"
    

    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.my-target-group.arn
    }
}







data "aws_subnet_ids" "subnet_ids" {
  vpc_id = aws_vpc.virginia-vpc.id
}

data "aws_subnet" "az_subnet" {
    count = "${length(data.aws_subnet_ids.subnet_ids.ids)}"
    id = "${tolist(data.aws_subnet_ids.subnet_ids.ids)[count.index]}"
  
}


