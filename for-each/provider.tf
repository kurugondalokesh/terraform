terraform{
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
      }
    }

    backend "s3" {
      bucket = "loki-remote-state"
      key = "remote-state-key"
      region = "us-east-1"
      dynamodb_table = "loki-loking"
    }
}

provider "aws" {
    region = "us-east-1"
}