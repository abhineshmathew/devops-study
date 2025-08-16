terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    #random provider is used to generate random values
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"  
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "random_string" "bucket_suffix" {
  length  = 8
  special = false
  upper   = false
}