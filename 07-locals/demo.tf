variable "instance_desc" {
  default={
    cart={
        instance_type = "t3.small"
        Name = "cart"
    }
    catalogue={
        instance_type="t3.micro"
        Name="catalogue"
    }
  }
}

locals {
  ins_type = {for k,v in var.instance_desc : k=>v.instance_type }
  ins_name = {for k,v in var.instance_desc : k=>v.Name}
}

output "type" {
  value = local.ins_type
}
output "name" {
  value = local.ins_name
}