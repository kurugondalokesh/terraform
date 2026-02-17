variable "environment" {
    default = "dev"
}

variable "instance_names"{
    type = list(string)
    default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
    default = "Z01619771MJT7AVCGE583"
}

variable "domain" {
    default = "lokiaws.online"
}