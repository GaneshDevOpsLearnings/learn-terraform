data "aws_ami" "example" {
  most_recent      = true
  owners           = ["245745413231"]
}

output "ami_id" {
  value = data.example.ami_id  
}
