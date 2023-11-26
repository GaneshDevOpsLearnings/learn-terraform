data "aws_ami" "example" {
  most_recent      = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

output "ami_id" {
  value = data.aws_ami.example.id
}


resource "aws_instance" "ec2" {
  ami= data.aws_ami.example.id
  instance_type = "t3.micro"

  tags = {
    Name = "catalogue"
  }  
}