resource "aws_instance" "example_web_server" {
ami = "ami-0cca134ec43cf708f"
instance_type = "t2.micro"
#subnet_id = module.vpc.web_subnet_id
subnet_id = subnetid

tags = {
Name = "example_web_server"
}
security_groups = [aws_security_group.example_web_security_group.id]
}
resource "aws_security_group" "example_web_security_group" {
  name = "example_web_security_group"
  description = "Allow HTTP traffic"
  vpc_id =  module.vpc.vpc_id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
 

output "websid" {

value= aws_security_group.example_web_security_group.id

}
