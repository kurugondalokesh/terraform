#Priority order of variables
#1. Command line terraform apply -var="instance_type=t3.small"
#2. terraform.tfvars
#3. Environ ment variables TF_VAR_instance_type = "t3.small"
#4. Default value in variable declaration
#5. Prompting for variable value during terraform apply

variable "ami_id" {
  type = string
  description = "This is ami id"
  default = "ami-0220d79f3f480ecf5"
}

variable "zone_id" {
    default = "Z01619771MJT7AVCGE583"
}

variable "domain" {
    default = "lokiaws.online"
}
variable tags{
    type = map
    default = {
        Name = "backend"
        Project = "Expense"
        Component = "backend"
        Environment = "DEV"
        terraform = "true"
    }
}


variable "instances" {
    type = map(string)
    default = {
      "mysql" = "t3.small"
      "frontend" = "t3.micro"
      "backend" = "t3.micro"
    }
}