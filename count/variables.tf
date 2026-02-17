variable "environment" {
    default = "dev"
}

variable "instance_names"{
    type = list(string)
    default = ["mysql", "backend", "fromtend"]
}

