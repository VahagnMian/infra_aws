resource "aws_instance" "my-webserver-1" {

    ami = "ami-083654bd07b5da81d"
    instance_type = "t2.micro"
    key_name = "secondKey"
    subnet_id = aws_subnet.virginia-subnet-1.id
    user_data = file("default_webserver-1.sh.tpl")
    vpc_security_group_ids = [aws_security_group.webserver-sg.id]


    tags =  {
      Name = "Nginx-1"
    }



}

resource "aws_instance" "my-webserver-2" {

    ami = "ami-083654bd07b5da81d"
    instance_type = "t2.micro"
    key_name = "secondKey"
    subnet_id = aws_subnet.virginia-subnet-2.id
    user_data = file("default_webserver-2.sh.tpl")
    vpc_security_group_ids = [aws_security_group.webserver-sg.id]


    tags =  {
      Name = "Nginx-2"
    }



}
