resource "aws_instance" "example_db_server" {
ami = "ami-0cca134ec43cf708f"
instance_type = "t2.micro"
subnet_id = module.vpc.dbmodule_id
tags = {
Name = "example_db_server"
}
security_groups = [aws_security_group.example_db_security_group.id]
}
resource "aws_security_group" "example_db_security_group" {
  name = "example_db_security_group"
  description = "Allow traffic from web servers"
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.example_php_security_group.id]
  }
}
