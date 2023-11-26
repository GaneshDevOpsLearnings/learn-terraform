resource "aws_instance" "ec2" {
  ami= data.aws_ami.example.id
  instance_type = "t3.micro"
  vpc_security_group_ids= [var.sg_id]
  tags = {
    Name = "catalogue"
  }  
}