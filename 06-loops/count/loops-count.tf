data "aws_ami" "example" {
  most_recent      = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}



resource "aws_instance" "ec2" {
    count = 3
  ami= data.aws_ami.example.id
  instance_type = "t3.micro"

  tags = {
    Name = "catalogue"
  }  
}

output "instance_details" {
  value = aws_instance.ec2.*.public_ip
  
}