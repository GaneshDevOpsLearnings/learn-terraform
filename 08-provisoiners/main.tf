data "aws_ami" "ami_details" {
  most_recent      = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "ec2" {
    ami= data.aws_ami.example.id
    vpc_security_group_ids = [ "vpc-05f0ca5e77906dcd1 " ]
  instance_type = "t3.micro"

  tags = {
    Name = "catalogue"
  }
}

resource "null_resource" "provision" {
    triggers = aws_instance.ec2.id
    provisioner "remote-exec" {
        connection {
          host = aws_instance.ec2.public_ip
          user = "centos"
          password = "DevOps321"
        }
        inline = [ "echo hello" ]
      
    }
}