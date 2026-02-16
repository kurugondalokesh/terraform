variable "ami_id" {
  type = string
  description = "This is ami id"
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "this is instance type"
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