data "aws_ami" "example" {
  most_recent      = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]
}

resource "aws_instance" "ec2" {
    for_each = var.instance_desc
  ami= data.aws_ami.example.id
  instance_type = each.value.instance_type

  tags = {
    Name = each.value.Name
  }  
}

output "publicip" {
    value = {
        for k,v in aws_instance.ec2 : k => v.public_ip
    }
  
}

variable "instance_desc" {
  default={
    cart={
        instance_type = "t3.mini"
        Name = "cart"
    }
    catalogue={
        instance_type="t3.micro"
        Name="catalogue"
    }
  }
}